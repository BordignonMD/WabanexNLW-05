defmodule Wabanex.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the IMC info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      assert %{
               "result" => %{
                 "Diego" => 23.04002019946976,
                 "Gabu" => 22.857142857142858,
                 "Matheus" => 21.952479338842977,
                 "Rafael" => 24.897060231734173,
                 "Rodrigo" => 26.234567901234566
               }
             } == response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{"filename" => "matheus.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      assert %{"result" => "Error while opening the file"} == response
    end
  end
end
