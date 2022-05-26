defmodule Period.Repo.Migrations.CreateSymptoms do
  use Ecto.Migration

  def change do
    create table(:symptoms) do
      add(:title, :string, null: false)
      add(:phase, :string, null: false)
      add(:recurring, :boolean)

      timestamps()
    end
  end
end
