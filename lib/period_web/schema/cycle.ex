defmodule PeriodWeb.Schema.Cycle do
  use Absinthe.Schema.Notation
  alias PeriodWeb.Resolvers.Cycles

  object :cycle do
    field :id, :id
    field :ovulating_window, list_of(:date)
    field :menstration_window, list_of(:date)
    field :start_date, :date
    field :end_date, :date
    field :current, :boolean, resolve: &Cycles.is_current/3
  end
end
