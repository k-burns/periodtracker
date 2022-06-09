defmodule Period.Tracker.DaysTest do
  use Period.DataCase

  alias Period.Tracker.Day

  describe "days" do
    import Period.TrackerFixtures

    @invalid_attrs %{date: "cat"}

    test "create_day/1 with valid data creates a day" do
      valid_attrs = %{
        date: "2022-03-16"
      }

      assert {:ok, %Day{} = day} = Day.create_day(valid_attrs)
      assert day.date == ~D[2022-03-16]
    end

    test "create_day/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Day.create_day(@invalid_attrs)
    end
  end
end
