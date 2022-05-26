defmodule Period.Tracker.Symptom do
  use Ecto.Schema
  import Ecto.Changeset
  alias Period.Repo

  alias Period.Tracker.Symptom

  schema "symptoms" do
    field :phase, :string
    field :title, :string
    field :recurring, :boolean
    timestamps()
  end

  @doc """
  Returns the list of symptoms.

  ## Examples

      iex> list_symptoms()
      [%Symptoms{}, ...]

  """
  def list_symptoms do
    {:ok, Repo.all(Symptom)}
  end

  @doc """
  Gets a single symptom by id.
  """
  def get_symptom_by_id(id) do
    case Repo.get(Symptom, id) do
      %Symptom{} = symptom ->
        {:ok, symptom}

      nil ->
        {:error, "No symptom by that ID."}
    end
  end

  @doc """
  Creates a symptom.

  ## Examples

      iex> create_symptom(%{field: value})
      {:ok, %Symptom{}}

      iex> create_symptom(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_symptom(attrs \\ %{}) do
    %Symptom{}
    |> Symptom.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a symptoms.

  ## Examples

      iex> update_symptoms(symptoms, %{field: new_value})
      {:ok, %Symptoms{}}

      iex> update_symptoms(symptoms, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_symptom(%Symptom{} = symptom, attrs) do
    symptom
    |> Symptom.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a symptom.

  ## Examples

      iex> delete_symptom(symptom)
      {:ok, %Symptom{}}

      iex> delete_symptoms(symptom)
      {:error, %Ecto.Changeset{}}

  """
  def delete_symptom(%Symptom{} = symptom) do
    Repo.delete(symptom)
  end

  @doc false
  def changeset(symptom, attrs) do
    symptom
    |> cast(attrs, [:title, :phase, :recurring])
    |> validate_required([:title, :phase])
  end
end
