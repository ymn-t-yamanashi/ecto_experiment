defmodule Movie do
  use Ecto.Schema

  schema "movies" do
    field :title, :string
    field :release_date, :date
    has_many :characters, Character
    has_one :screenplay, Screenplay
  end
end
