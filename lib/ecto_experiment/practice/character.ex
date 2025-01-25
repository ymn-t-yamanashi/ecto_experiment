defmodule Character do
  use Ecto.Schema

  schema "characters" do
    field :name, :string
    field :age, :integer
    belongs_to :movie, Movie
  end
end
