defmodule PeriodWeb.Mutations.Tracker.CreateSymptomTest do
  use PeriodWeb.ConnCase, async: true

  @query """
  mutation CreateSymptom($title: String!, $phase: String!) {
    createSymptom(title: $title, phase: $phase) {
      id
      title
      phase
    }
  }
  """

  describe "Resolvers.Symptoms.create_symptom/3" do
    test "creates a symptom" do

      input = %{
        "title" => "My Symptom",
        "phase" => "ovulating",
      }

      conn =
        build_conn()
        |> post("/api", query: @query, variables: input)

      %{
        "data" => %{
          "createSymptom" => %{
            "title" => title
          }
        }
      } = json_response(conn, 200)

      assert title == "My Symptom"
    end

    test "returns an error when given invalid attrs" do

      input = %{
        "title" => "",
        "phase" => ""
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

      assert error == "There was an error creating symptom."
    end
  end
end
