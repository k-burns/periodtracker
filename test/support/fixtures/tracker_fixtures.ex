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
end
