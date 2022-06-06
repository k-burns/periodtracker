defmodule PeriodWeb.Resolvers.Cycles do
  alias Period.Tracker.Cycle

  def list_cycles(_, _, _), do: Cycle.list_cycles()

  def create_cycle(_, args, _) do
    case Cycle.create_cycle(args) do
      {:error, _changeset} -> {:error, "There was an error creatind cycle."}
      {:ok, cycle} -> {:ok, cycle}
    end
  end

  def is_current(%Cycle{start_date: start_date, end_date: end_date}, _, _) do
    range = Date.range(start_date, end_date)
    is_curr = Enum.member?(range, Date.utc_today)
    {:ok, is_curr}
  end
end
