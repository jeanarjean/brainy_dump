defmodule BrainyDump.Repo.Migrations.DropUniqueIndexForTags do
  use Ecto.Migration

  def change do
    drop(unique_index(:tags, [:name]))
  end
end
