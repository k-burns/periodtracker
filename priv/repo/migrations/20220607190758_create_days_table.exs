defmodule Period.Repo.Migrations.CreateDaysTable do
  use Ecto.Migration

  def change do
    create table (:days) do
      add(:date, :date)
      add(:cycle_id, references(:cycles))
      timestamps()

    end

    alter table (:symptoms) do
      add(:day_id, references(:days))
    end
  end
end
