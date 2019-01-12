defmodule BrainyDumpWeb.PostView do
  use BrainyDumpWeb, :view

  alias BrainyDumpWeb.PostView
  require Logger

  def render("index.json", %{posts: posts}) do
    render_many(posts, PostView, "post.json")
  end

  def render("show.json", %{post: post}) do
    render_one(post, PostView, "post.json")
  end

  def render("post.json", %{post: post}) do
    %{
      id: post.id,
      title: post.title,
      body: post.body,
      updated_at: post.updated_at,
      inserted_at: post.inserted_at
    }
  end

  def render("post_complete.json", %{post: post}) do
    case post.tags do
      nil ->
        %{
          id: post.id,
          title: post.title,
          body: post.body,
          updated_at: post.updated_at,
          inserted_at: post.inserted_at
        }

      tags ->
        %{
          id: post.id,
          title: post.title,
          body: post.body,
          updated_at: post.updated_at,
          inserted_at: post.inserted_at,
          tags: render_many(tags, BrainyDumpWeb.TagView, "tag_no_posts.json")
        }
    end

    %{
      id: post.id,
      title: post.title,
      body: post.body,
      updated_at: post.updated_at,
      inserted_at: post.inserted_at,
      tags: render_many(post.tags, BrainyDumpWeb.TagView, "tag_no_posts.json")
    }
  end
end
