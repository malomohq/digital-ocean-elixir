defmodule DigitalOcean.AccountTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{Account, Operation}

  test "get/0" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/account")

    assert expected == Account.get()
  end
end
