defmodule BrainyDumpWeb.TagView do
  use BrainyDumpWeb, :view

  alias BrainyDumpWeb.TagView
  alias BrainyDumpWeb.Post
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
      posts: render_many(tag.posts, BrainyDumpWeb.PostView, "post.json")
    }
  end
end
