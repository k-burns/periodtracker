defmodule PeriodWeb.Queries.Symptom do
  use Absinthe.Schema.Notation
  alias PeriodWeb.Resolvers

  object :symptom_queries do
    @desc "Look up a single symptom."
    field :symptom, :symptom do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Symptoms.get_symptom_by_id/3)
    end

    @desc "Look up symptoms."
    field :symptoms, list_of(:symptom) do
      resolve(&Resolvers.Symptoms.list_symptoms/3)
    end
  end
end
