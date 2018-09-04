defmodule BrainyDump.Repo.Migrations.CreatePostsTagsTable do
  use Ecto.Migration

  def change do
    create table(:posts_tags, primary_key: false) do
      add :tag_id, references(:tags, on_delete: :nothing), primary_key: true
      add :post_id, references(:posts, on_delete: :nothing), primary_key: true
    end
  end
end
