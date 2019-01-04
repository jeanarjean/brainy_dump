defmodule BrainyDumpWeb.TagView do
  use BrainyDumpWeb, :view

  alias BrainyDumpWeb.TagView
  require Logger

  def render("index.json", %{tags: tags}) do
    render_many(tags, TagView, "tag.json")
  end

  def render("show.json", %{tag: tag}) do
    render_one(tag, TagView, "tag.json")
  end

  def render("tag.json", %{tag: tag}) do
    %{
      id: tag.id,
      name: tag.name,
      posts: render_many(tag.posts, BrainyDumpWeb.PostView, "post.json"),
      parent: tag.parent,
      updated_at: tag.updated_at,
      inserted_at: tag.inserted_at
    }
  end

  def render("tag_no_posts.json", %{tag: tag}) do
    %{
      id: tag.id,
      name: tag.name,
      updated_at: tag.updated_at,
      inserted_at: tag.inserted_at
    }
  end
end
