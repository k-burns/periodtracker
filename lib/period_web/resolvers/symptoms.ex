defmodule PeriodWeb.Resolvers.Symptoms do
  alias Period.Tracker.Symptom
  def list_symptoms(_, _, _), do: Symptom.list_symptoms()

  def get_symptom_by_id(_, %{id: id}, _), do: Symptom.get_symptom_by_id(id)

  def create_symptom(_, args, _) do
    case Symptom.create_symptom(args) do
      {:error, _changeset} -> {:error, "There was an error creating symptom."}
      {:ok, symptom} -> {:ok, symptom}
    end
  end

  def update_symptom(_, args = %{id: id}, _) do
    with {:ok, %Symptom{} = symptom} <- Symptom.get_symptom_by_id(id),
      {:ok, updated_symptom} <- Symptom.update_symptom(symptom, args) do
      {:ok, updated_symptom}
    else
      _ -> {:error, "error updating symptom"}
    end
  end

  def delete_symptom(_, %{id: id}, _) do
    with {:ok, %Symptom{} = symptom} <- Symptom.get_symptom_by_id(id),
      {:ok, deleted_symptom} <- Symptom.delete_symptom(symptom) do
      {:ok, deleted_symptom}
    else
      _ -> {:error, "error deleting symptom"}
    end
  end
end
