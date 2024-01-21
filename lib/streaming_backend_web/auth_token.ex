defmodule StreamingBackendWeb.AuthToken do
  @user_salt "user auth salt"

  @doc """
  Signs an authentication token for a user.

  ## Parameters
    * `user` - The user for whom the token is signed.

  ## Returns
    A signed token.

  """
  def sign(user) do
    Phoenix.Token.sign(StreamingBackendWeb.Endpoint, @user_salt, %{id: user.id})
  end

  @doc """
  Verifies the validity of an authentication token.

  ## Parameters
    * `token` - The token to be verified.

  ## Returns
    A boolean indicating whether the token is valid.

  ## Options
    * `max_age` - The maximum duration of token validity in seconds.

  """
  def verify(token) do
    Phoenix.Token.verify(StreamingBackendWeb.Endpoint, @user_salt, token, [
      max_age: 365 * 24 * 3600
    ])
  end

end
