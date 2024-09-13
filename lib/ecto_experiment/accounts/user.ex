defmodule EctoExperiment.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    IO.inspect(attrs)
    user
    |> cast(attrs, [:name])
    |> validate_required([:name], message: "空でござる") # エラーメッセージカスタマイズ
    |> validate_name()

  end

  # 独自独自バリデーション関数作成
  defp validate_name(changeset) do
    changeset
    |> validate_length(:name, min: 2, message: "最小は２文字でござる")
    |> validate_format(:name, ~r/[a-z]/, message: "a〜zを含むでござる")
  end

end
