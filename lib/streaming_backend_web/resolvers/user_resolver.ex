defmodule StreamingBackendWeb.Resolvers.UserResolver do
  alias StreamingBackend.Accounts
  alias StreamingBackendWeb.Schema.ChangesetErrors

  @is_dev_env Application.compile_env(:streaming_backend, :env) == :dev


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
end
