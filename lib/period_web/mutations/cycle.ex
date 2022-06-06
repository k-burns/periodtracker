defmodule PeriodWeb.Mutations.Cycle do
  use Absinthe.Schema.Notation
  alias PeriodWeb.Resolvers

  object :cycle_mutations do
    @desc "Creates a cycle"
    field :create_cycle, :cycle do
      arg(:ovulating_window, list_of(:date))
      arg(:menstration_window, list_of(:date))
      arg(:start_date, :date)
      arg(:end_date, :date)
      resolve(&Resolvers.Cycles.create_cycle/3)
    end
  end
end
