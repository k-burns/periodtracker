defmodule PeriodWeb.PageController do
  use PeriodWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
