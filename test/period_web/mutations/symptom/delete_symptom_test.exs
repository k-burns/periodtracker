defmodule PeriodWeb.Mutations.Tracker.DeleteSymptomTest do
  use PeriodWeb.ConnCase, async: true
  alias Period.Tracker.Symptom

  @query """
  mutation DeleteSymptom($id: ID!) {
    deleteSymptom(id: $id) {
      id
    }
  }
  """
  describe "Resolvers.Symptoms.delete_symptom/3" do
    test "deletes a symptom" do
      %Symptom{id: id} = Period.TrackerFixtures.symptom_fixture()

      input = %{
        id: id
      }

      conn =
        build_conn()
        |> post("/api", query: @query, variables: input)

      assert %{
               "data" => %{
                 "deleteSymptom" => %{
                   "id" => deleted_id
                 }
               }
             } = json_response(conn, 200)
      assert deleted_id == "#{id}"
    end

    test "returns an error with an incorrect id" do

      input = %{
        id: 1
      }

      conn =
        build_conn()
        |> post("/api", query: @query, variables: input)

      assert %{
               "errors" => [
                 %{"message" => error}
               ]
             } = json_response(conn, 200)

      assert error == "error deleting symptom"
    end
  end
end
