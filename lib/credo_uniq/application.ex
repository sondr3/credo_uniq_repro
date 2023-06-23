defmodule CredoUniq.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CredoUniqWeb.Telemetry,
      # Start the Ecto repository
      CredoUniq.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CredoUniq.PubSub},
      # Start Finch
      {Finch, name: CredoUniq.Finch},
      # Start the Endpoint (http/https)
      CredoUniqWeb.Endpoint
      # Start a worker by calling: CredoUniq.Worker.start_link(arg)
      # {CredoUniq.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CredoUniq.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CredoUniqWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
