defmodule StreamingBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StreamingBackendWeb.Telemetry,
      StreamingBackend.Repo,
      {DNSCluster, query: Application.get_env(:streaming_backend, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: StreamingBackend.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: StreamingBackend.Finch},
      # Start a worker by calling: StreamingBackend.Worker.start_link(arg)
      # {StreamingBackend.Worker, arg},
      # Start to serve requests, typically the last entry
      StreamingBackendWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StreamingBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StreamingBackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
