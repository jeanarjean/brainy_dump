defmodule BrainyDumpWeb.Tag do
  use BrainyDumpWeb, :model

  schema "tags" do
    field :name, :string

    many_to_many :posts, BrainyDumpWeb.Post, join_through: "posts_tags"

    timestamps()
  end

  def changeset(tag, params) do
    tag
    |> cast(params, ~w(name), [])
    |> cast_assoc(:posts)
  end
end
