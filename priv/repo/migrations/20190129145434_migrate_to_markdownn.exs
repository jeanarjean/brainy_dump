defmodule BrainyDump.Repo.Migrations.MigrateToMarkdownn do
  use Ecto.Migration

  import Ecto.Query
  alias BrainyDump.Repo
  alias BrainyDumpWeb.Post
  import Logger

  def up do
    posts =
      Post
      |> Repo.all()
      |> Enum.map(fn post -> Repo.preload(post, [:tags, :user]) end)

    posts
    |> Enum.map(fn post ->
      {result, 0} =
        System.cmd("python", [
          "priv/repo/migration-operations/html_to_markdown_migration.py",
          post.body
        ])

      post = Post.changeset(post, %{body: result}, nil, nil)
      Repo.update(post)
    end)
  end

  def down do
    posts =
      Post
      |> Repo.all()
      |> Enum.map(fn post -> Repo.preload(post, [:tags, :user]) end)

    posts
    |> Enum.map(fn post ->
      {result, 0} =
        System.cmd("python", [
          "priv/repo/migration-operations/markdown_to_html_migration.py",
          post.body
        ])

      post = Post.changeset(post, %{body: result}, nil, nil)
      Repo.update(post)
    end)
  end
end
