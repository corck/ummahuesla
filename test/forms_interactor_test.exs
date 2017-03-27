defmodule FormsInteractorTest do
  use ExUnit.Case
  #doctest Ummahuesla

  import Ummahuesla.FormsInteractor, only: [ map_data_to_form_ids: 1]

  describe "transforming of data" do

    setup do
      [data: %{name: "Christoph", email: "foo@bar.com"}]
    end

    test "transforms keys to google docs id", fixture do
      result = ["entry.1028970138": "foo@bar.com", "entry.701965180": "Christoph"]
      assert map_data_to_form_ids(fixture.data) == result
    end

  end
end
