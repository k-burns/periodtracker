defmodule Period.TrackerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Period.Tracker` context.
  """

  @doc """
  Generate a symptoms.
  """
  def symptom_fixture(attrs \\ %{}) do
    {:ok, symptom} =
      attrs
      |> Enum.into(%{
        phase: "some phase",
        title: "some symptom"
      })
      |> Period.Tracker.Symptom.create_symptom()

    symptom
  end

  def cycle_fixture(attrs \\ %{}) do
    {:ok, cycle} =
      attrs
      |> Enum.into(%{
        ovulating_window: ["2022-01-01", "2022-01-15"],
        menstration_window: ["2022-01-22", "2022-01-30"],
        start_date: "2022-01-01",
        end_date: "2022-01-30"
      })
      |> Period.Tracker.Cycle.create_cycle()

    cycle
  end
end
