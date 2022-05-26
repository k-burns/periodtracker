defmodule Period.Tracker.SymptomTest do
  use Period.DataCase

  alias Period.Tracker.Symptom

  describe "symptom" do
    import Period.TrackerFixtures

    @invalid_attrs %{phase: nil, title: nil}

    test "list_symptoms/0 returns all symptoms" do
      symptom = symptom_fixture()
      assert Symptom.list_symptoms() == {:ok, [symptom]}
    end

    test "create_symptom/1 with valid data creates a symptom" do
      valid_attrs = %{
        title: "headache",
        phase: "some phase"
      }

      assert {:ok, %Symptom{} = symptom} = Symptom.create_symptom(valid_attrs)
      assert symptom.phase == "some phase"
      assert symptom.title == "headache"
    end

    test "create_symptom/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Symptom.create_symptom(@invalid_attrs)
    end

    test "update_symptom/2 with valid data updates the symptom" do
      symptom = symptom_fixture()

      update_attrs = %{
        title: "migraine",
        phase: "period"
      }

      assert {:ok, %Symptom{} = symptom} = Symptom.update_symptom(symptom, update_attrs)
      assert symptom.title == "migraine"
      assert symptom.phase == "period"
    end

    test "update_symptom/2 with invalid data returns error changeset" do
      symptom = symptom_fixture()
      assert {:error, %Ecto.Changeset{}} = Symptom.update_symptom(symptom, @invalid_attrs)
      assert {:ok, symptom} == Symptom.get_symptom_by_id(symptom.id)
    end

    test "delete_symptom/1 deletes the symptom" do
      symptom = symptom_fixture()
      assert {:ok, %Symptom{}} = Symptom.delete_symptom(symptom)
      assert Symptom.get_symptom_by_id(symptom.id) == {:error, "No symptom by that ID."}
    end
  end
end
