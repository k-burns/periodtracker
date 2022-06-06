defmodule PeriodWeb.Queries.Cycle.CyclesTest do
  use PeriodWeb.ConnCase, async: true
  alias Period.Tracker.Cycle

  @query """
    query Cycles {
      cycles {
        id
        current
      }
    }
  """

  describe "list all cycles" do
    test "returns all cycles" do
      %Cycle{start_date: start_date, end_date: end_date} = Period.TrackerFixtures.cycle_fixture()

      conn = build_conn() |> post("/api", query: @query)

      assert %{"data" => %{"cycles" => [
        %{
          "current" => curr
        }
      ]}} = json_response(conn, 200)

      range = Date.range(start_date, end_date)
      is_curr = Enum.member?(range, Date.utc_today)
      assert is_curr == curr
    end
  end
end
