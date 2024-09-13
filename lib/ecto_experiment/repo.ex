defmodule EctoExperiment.Repo do
  use Ecto.Repo,
    otp_app: :ecto_experiment,
    adapter: Ecto.Adapters.SQLite3
end
