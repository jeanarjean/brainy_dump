defmodule BrainyDumpWeb.Tag do
  use BrainyDumpWeb, :model

  schema "tags" do
    field :name, :string

    many_to_many :posts, BrainyDumpWeb.Post, join_through: "posts_tags"

    timestamps()
  end

  def changeset(tag, params, posts \\ nil)
  def changeset(tag, params, nil) do
    tag
    |> cast(params, ~w(name), [])
    |> validate_length(:name, max: 60)
    |> unique_constraint(:name)
  end
  def changeset(tag, params, posts) do
    tag
    |> cast(params, ~w(name), [])
    |> put_assoc(:posts, posts)
    |> validate_length(:name, max: 60)
    |> unique_constraint(:name)
  end
end
