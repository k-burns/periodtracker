defmodule PeriodWeb.Queries.Symptom.SymptomTest do
  use PeriodWeb.ConnCase, async: true
  alias Period.Tracker.Symptom

  @query """
  query Symptom($id: ID!) {
    symptom(id: $id) {
      id
    }
  }
  """

  describe "Resolvers.Symptoms.get_symptom_by_id/3" do
    test "returns an error with an invalid id" do
      input = %{
        id: 1
      }

      conn =
        build_conn()
        |> post("/api", query: @query, variables: input)

      assert %{
               "errors" => [
                 %{
                   "message" => error
                 }
               ]
             } = json_response(conn, 200)

      assert error == "No symptom by that ID."
    end

    test "returns symptom" do
      %Symptom{id: symptom_id} = Period.TrackerFixtures.symptom_fixture()

      input = %{id: symptom_id}

      conn =
        build_conn()
        |> post("/api", query: @query, variables: input)

      assert %{
               "data" => %{
                 "symptom" => %{
                   "id" => returned_id
                 }
               }
             } = json_response(conn, 200)
      assert returned_id == "#{symptom_id}"
    end
  end
end
