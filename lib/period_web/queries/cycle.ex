defmodule PeriodWeb.Queries.Cycle do
  use Absinthe.Schema.Notation
  alias PeriodWeb.Resolvers

  object :cycle_queries do
    @desc "Look up cycles"
    field :cycles, list_of(:cycle) do
      resolve(&Resolvers.Cycles.list_cycles/3)
    end
  end
end
