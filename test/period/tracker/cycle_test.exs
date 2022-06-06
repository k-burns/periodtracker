defmodule Period.Tracker.CycleTest do
  use Period.DataCase

  alias Period.Tracker.Cycle

  describe "cycle" do
    import Period.TrackerFixtures

    @invalid_attrs %{ovulating_window: ["bob"], period_window: ["gene"]}

    test "list_cycles/0 returns all cycles" do
      cycle = cycle_fixture()
      assert Cycle.list_cycles() == {:ok, [cycle]}
    end

    test "create_cycle/1 with valid data creates a cycle" do
      valid_attrs = %{
        ovulating_window: ["2022-03-16", "2022-03-21"],
        menstration_window: ["2022-04-02", "2022-04-13"],
        start_date: "2022-03-16",
        end_date: "2022-04-13"
      }

      assert {:ok, %Cycle{} = cycle} = Cycle.create_cycle(valid_attrs)
      assert cycle.ovulating_window == [~D[2022-03-16], ~D[2022-03-21]]
      assert cycle.menstration_window ==
      [~D[2022-04-02], ~D[2022-04-13]]
      assert cycle.start_date == ~D[2022-03-16]
      assert cycle.end_date == ~D[2022-04-13]
    end

    test "create_cycle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cycle.create_cycle(@invalid_attrs)
    end
  end
end
