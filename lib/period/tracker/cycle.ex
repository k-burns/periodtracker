defmodule Period.Tracker.Cycle do
  use Ecto.Schema
  import Ecto.Changeset
  alias Period.Repo

  alias Period.Tracker.Cycle
  alias Period.Tracker.Day

  schema "cycles" do
    field :ovulating_window, {:array, :date}
    field :menstration_window, {:array, :date}
    field(:start_date, :date)
    field(:end_date, :date)
    field :current, :boolean, virtual: true
    timestamps()

    has_many :days, Day
  end

   @doc """
  Returns the list of cycles.

  ## Examples

      iex> list_cycles()
      [%Cycles{}, ...]

  """
  def list_cycles do
    {:ok, Repo.all(Cycle)}
  end

  @doc """
  Creates a cycle.

  ## Examples
     iex> create_cycle(%{field: value})
      {:ok, %Cycle{}}

      iex> create_cycle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """

  def create_cycle(attrs \\ %{}) do
    %Cycle{}
    |> Cycle.changeset(attrs)
    |> Repo.insert()
  end

  def changeset(cycle, attrs) do
    cycle
    |> cast(attrs, [:ovulating_window, :menstration_window, :start_date, :end_date, :current])
  end

end
