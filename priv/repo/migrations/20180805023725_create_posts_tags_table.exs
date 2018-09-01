defmodule BrainyDump.Repo.Migrations.CreatePostsTagsTable do
  use Ecto.Migration

  def change do
    create table(:posts_tags) do
      add :tag_id, references(:posts, on_delete: :nothing), primary_key: true
      add :post_id, references(:tags, on_delete: :nothing), primary_key: true

      timestamps()
    end
  end
end
