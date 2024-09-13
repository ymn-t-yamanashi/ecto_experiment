defmodule EctoExperiment.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      EctoExperimentWeb.Telemetry,
      # Start the Ecto repository
      EctoExperiment.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: EctoExperiment.PubSub},
      # Start Finch
      {Finch, name: EctoExperiment.Finch},
      # Start the Endpoint (http/https)
      EctoExperimentWeb.Endpoint
      # Start a worker by calling: EctoExperiment.Worker.start_link(arg)
      # {EctoExperiment.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EctoExperiment.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EctoExperimentWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
