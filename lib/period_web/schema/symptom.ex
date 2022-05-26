defmodule PeriodWeb.Schema.Symptom do
  use Absinthe.Schema.Notation

  object :symptom do
    field :id, :id
    field :title, :string
    field :phase, :string
    field :recurring, :boolean
  end
end
