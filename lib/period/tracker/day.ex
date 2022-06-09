defmodule Period.Tracker.Day do
  use Ecto.Schema
  import Ecto.Changeset
  alias Period.Repo

  alias Period.Tracker.Day
  alias Period.Tracker.Cycle
  alias Period.Tracker.Symptom

  schema "days" do
    field :date, :date
    field :is_period, :boolean, virtual: true
    field :is_ovulating, :boolean, virtual: true
    timestamps()

    belongs_to :cycles, Cycle
    has_many :symptoms, Symptom
  end

  @doc """
  Creates a cycle

  ## Examples


  """
  def create_day(attrs \\ %{}) do
    %Day{}
    |> Day.changeset(attrs)
    |> Repo.insert()
  end

  def changeset(day, attrs) do
    day
    |> cast(attrs, [:date, :is_period, :is_ovulating])
    |> validate_required([:date])
  end
end
