defmodule Period.Repo do
  use Ecto.Repo,
    otp_app: :period,
    adapter: Ecto.Adapters.Postgres
end
