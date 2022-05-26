defmodule PeriodWeb.Queries.Sumptom.SymptomsTest do
  use PeriodWeb.ConnCase, async: true

  describe "Resolvers.Symptoms.list_symptoms/3" do
    test "returns all symptoms if no criteria is given" do
      query = """
      query Symptoms {
        symptoms {
          id
        }
      }
      """
     Period.TrackerFixtures.symptom_fixture()
     Period.TrackerFixtures.symptom_fixture()

      conn = build_conn() |> post("/api", query: query)

      assert %{"data" => %{"symptoms" => symptoms}} = json_response(conn, 200)

      assert Enum.count(symptoms) == 2
    end
  end
end
