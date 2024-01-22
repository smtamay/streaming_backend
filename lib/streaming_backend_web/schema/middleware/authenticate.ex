defmodule StreamingBackendWeb.Schema.Middleware.Authenticate do
  @behaviour Absinthe.Middleware

  def call(resolution, _) do
    case resolution.context do
      %{current_user: _} -> resolution
      _ -> put_error(resolution, "Please sign in first!")
    end
  end

  defp put_error(resolution, message) do
    Absinthe.Resolution.put_result(resolution, {:error, message})
  end
end
