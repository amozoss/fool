defmodule Fool.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FoolWeb.Telemetry,
      Fool.Repo,
      {DNSCluster, query: Application.get_env(:fool, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Fool.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Fool.Finch},
      # Start a worker by calling: Fool.Worker.start_link(arg)
      # {Fool.Worker, arg},
      # Start to serve requests, typically the last entry
      FoolWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fool.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FoolWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
