defmodule BrainyDumpWeb.Post do
  use BrainyDumpWeb, :model

  schema "posts" do
    field(:title, :string)
    field(:body, :string)

    many_to_many(:tags, BrainyDumpWeb.Tag, join_through: "posts_tags")

    timestamps()
  end

  def changeset(post, params) do
    post
    |> cast(params, ~w(title body), [])
    |> cast_assoc(:tags)
  end
end
