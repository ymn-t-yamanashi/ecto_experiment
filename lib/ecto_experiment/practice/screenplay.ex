defmodule Screenplay do
  use Ecto.Schema

  schema "sereenplays" do
    field :lead_writer, :string
    belongs_to :movie, Movie
  end
end
