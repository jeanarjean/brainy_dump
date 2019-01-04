defmodule BrainyDump.Repo.Migrations.CreateTagChildren do
  use Ecto.Migration

  def change do
    alter table(:tags) do
      add(:parent_id, references(:tags, type: :id))
    end
  end
end
