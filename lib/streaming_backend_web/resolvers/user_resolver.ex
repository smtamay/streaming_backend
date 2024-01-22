defmodule StreamingBackendWeb.Resolvers.UserResolver do
  alias StreamingBackend.Accounts
  alias StreamingBackend.Accounts.User
  alias StreamingBackendWeb.Schema.ChangesetErrors

  @doc """
  Get the current user
  """
  def me(_, _, %{context: %{current_user: user}}) do
    {:ok, user}
  end

  def me(_, _, _) do
    {:ok, nil}
  end

  @doc """
  Register a new user.
  """
  def signup(_, %{username: username, email: email, password: password}, _) do
    case Accounts.register_user(%{username: username, email: email, password: password}) do
      {:ok, user} ->
        token = StreamingBackendWeb.AuthToken.sign(user)
        {:ok, %{user: user, token: token}}

      {:error, %Ecto.Changeset{} = changeset} ->
        {
          :error,
          message: "No hemos podido crear tu cuenta.",
          details: ChangesetErrors.error_details(changeset)
        }
    end
  end

  @doc """
  Sign in a user.
  """
  def signin(_, %{email: email, password: password}, _) do
    case Accounts.get_user_by_email_and_password(email, password) do
      nil ->
        {:error, "Contraseña o correo incorrectos!"}

      %User{} = user ->
        token = StreamingBackendWeb.AuthToken.sign(user)
        {:ok, %{user: user, token: token}}
    end
  end
end
