defmodule StreamingBackend.Repo do
  use Ecto.Repo,
    otp_app: :streaming_backend,
    adapter: Ecto.Adapters.Postgres
end
