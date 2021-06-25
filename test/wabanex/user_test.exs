defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns the changeset" do
      params = %{name: "Matheus", email: "matheusdb_@outlook.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "matheusdb_@outlook.com", name: "Matheus", password: "123456"},
               errors: []
             } = response
    end

    test "when there all invalid params, returns a invalid changeset" do
      params = %{name: "", email: "matheusdb_@outlook.com"}

      response = User.changeset(params)

      assert errors_on(response) == %{
               name: ["can't be blank"],
               password: ["can't be blank"]
             }
    end
  end
end
