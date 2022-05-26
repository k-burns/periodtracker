defmodule PeriodWeb.Mutations.Symptom do
  use Absinthe.Schema.Notation
  alias PeriodWeb.Resolvers

  object :symptom_mutations do
    @desc "Creates a symptom"
    field :create_symptom, :symptom do
      arg(:title, non_null(:string))
      arg(:phase, non_null(:string))
      resolve(&Resolvers.Symptoms.create_symptom/3)
    end

    @desc "updates a symptom"
    field :update_symptom, :symptom do
      arg(:id, non_null(:id))
      arg(:title, :string)
      arg(:phase, :string)
      resolve(&Resolvers.Symptoms.update_symptom/3)
    end

    @desc "deletes a symptom"
    field :delete_symptom, :symptom do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Symptoms.delete_symptom/3)
    end


  end
end
