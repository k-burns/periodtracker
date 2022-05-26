defmodule PeriodWeb.Mutations.Tracker.UpdateSymptomTest do
  use PeriodWeb.ConnCase, async: true
  alias Period.Tracker.Symptom

  @query """
  mutation UpdateSymptom($id: ID!, $title: String, $phase: String) {
    updateSymptom(id: $id, title: $title, phase: $phase) {
      id
      title
      phase
    }
  }
  """

  describe "Resolvers.Symptoms.update_symptom/3" do
    test "updates the symptom with valid attributes" do
      %Symptom{id: id} = Period.TrackerFixtures.symptom_fixture()

      input = %{
        "id" => id,
        "title" => "Migraine",
        "phase" => "period",
      }

      conn =
        build_conn()
        |> post("/api", query: @query, variables: input)

      assert %{
               "data" => %{
                 "updateSymptom" => %{
                   "id" => updated_symptom_id,
                   "title" => "Migraine",
                   "phase" => "period"
                 }
               }
             } = json_response(conn, 200)
      assert updated_symptom_id == "#{id}"
    end

    test "fails with invalid attrs" do
      %Symptom{id: id} = Period.TrackerFixtures.symptom_fixture()
      input = %{
        "id" => id,
        "title" => "",
        "phase" => "",
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
      assert error == "error updating symptom"
    end

    test "fails with invalid ID" do
     Period.TrackerFixtures.symptom_fixture()

      input = %{
        "id" => 1,
        "title" => "Migraine",
        "phase" => "period",
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

      assert error == "error updating symptom"
    end
  end
end
