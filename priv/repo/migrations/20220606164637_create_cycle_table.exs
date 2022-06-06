defmodule Period.Repo.Migrations.CreateCycleTable do
  use Ecto.Migration

  def change do
    create table(:cycles) do
      add(:ovulating_window, {:array, :date})
      add(:menstration_window, {:array, :date})
      add(:start_date, :date)
      add(:end_date, :date)

      timestamps()
    end
  end
end
