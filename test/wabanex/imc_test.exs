defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      assert {:ok,
              %{
                "Diego" => 23.04002019946976,
                "Gabu" => 22.857142857142858,
                "Matheus" => 21.952479338842977,
                "Rafael" => 24.897060231734173,
                "Rodrigo" => 26.234567901234566
              }} == response
    end

    test "when the wrong filename is given, returns an error" do
      params = %{"filename" => "matheus.csv"}

      response = IMC.calculate(params)

      assert {:error, "Error while opening the file"} == response
    end
  end
end
