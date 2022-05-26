defmodule PeriodWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(Absinthe.Plug.Types)

  import_types(PeriodWeb.Schema.Symptom)

  import_types(PeriodWeb.Queries.Symptom)
  import_types(PeriodWeb.Mutations.Symptom)

  query do
    import_fields(:symptom_queries)
  end

  mutation do
    import_fields(:symptom_mutations)
  end
end
