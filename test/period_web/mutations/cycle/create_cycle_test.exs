defmodule PeriodWeb.Mutations.Tracker.CreateCycleTest do
  use PeriodWeb.ConnCase, async: true

  @query """
  mutation CreateCycle($ovulatingWindow: [Date], $menstrationWindow: String!, $startDate: Date, $endDate: Date) {
    createCycle(ovulatingWindow: $ovulatingWindow, menstrationWindow: $menstrationWindow, startDate: $startDate, endDate: $endDate) {
      ovulatingWindow
      menstrationWindow
      startDate
      endDate
    }
  }
  """

  describe "Resolvers.Cycles.create_cycle/3" do
    test "creates a cycle" do

      input = %{
        "ovulatingWindow" => ["2022-03-16", "2022-03-21"],
        "menstrationWindow" => ["2022-04-02", "2022-04-13"],
        "startDate" => "2022-03-10",
        "endDate" => "2022-04-13"
      }

      conn =
        build_conn()
        |> post("/api", query: @query, variables: input)

      %{
        "data" => %{
          "createCycle" => %{
            "ovulatingWindow" => ovu,
            "menstrationWindow" => men,
            "startDate" => start,
            "endDate" => end_d
          }
        }
      } = json_response(conn, 200)

      assert ovu == ["2022-03-16", "2022-03-21"]
      assert men == ["2022-04-02", "2022-04-13"]
      assert start == "2022-03-10"
      assert end_d == "2022-04-13"
    end

    test "returns an error when given invalid attrs" do

      input = %{
        "ovulatingWindow" => ["no date"],
        "menstrationWindow" => ["no valid"]
      }

      conn =
        build_conn()
        |> post("/api", query: @query, variables: input)

      assert %{
               "errors" => errors
             } = json_response(conn, 200)

        assert Enum.count(errors) == 2
    end
  end
end
