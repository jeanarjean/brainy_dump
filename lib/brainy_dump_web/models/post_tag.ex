defmodule BrainyDumpWeb.PostTag do
  use BrainyDumpWeb, :model

  alias BrainyDumpWeb.Post
  alias BrainyDumpWeb.Tag

  schema "posts_tags" do
    belongs_to :post, Post
    belongs_to :tag, Tag
  end
end
