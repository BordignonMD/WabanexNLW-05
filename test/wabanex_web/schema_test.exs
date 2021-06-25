defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.{Training, User}
  alias Wabanex.{Trainings, Users}

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      user_params = %{name: "Matheus", email: "matheusdb_@outlook.com", password: "123456"}

      {:ok, %User{id: user_id}} = Users.Create.call(user_params)

      training_params = %{
        user_id: user_id,
        start_date: "2021-06-24",
        end_date: "2021-07-24",
        exercises: [
          %{
            name: "Triceps banco",
            youtube_video_url: "www.google.com",
            protocol_description: "regular",
            repetitions: "3x12"
          }
        ]
      }

      {:ok, %Training{id: _training_id}} = Trainings.Create.call(training_params)

      query = """
      {
        getUser(id: "#{user_id}"){
          name,
          email,
          trainings{
            startDate,
            endDate,
            exercises{
              name,
              repetitions
            }
          }
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "matheusdb_@outlook.com",
            "name" => "Matheus",
            "trainings" => [
              %{
                "endDate" => "2021-07-24",
                "exercises" => [
                  %{
                    "name" => "Triceps banco",
                    "repetitions" => "3x12"
                  }
                ],
                "startDate" => "2021-06-24"
              }
            ]
          }
        }
      }

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
      mutation {
        createUser(input: {name: "Matheus", email: "matheusdb_@outlook.com", password: "123456"}){
          id
          name
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "Matheus"}}} = response
    end
  end
end

#55
