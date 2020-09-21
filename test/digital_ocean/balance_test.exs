defmodule DigitalOcean.BalanceTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Balance, Operation }

  test "get/0" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/customers/my/balance")

    assert expected == Balance.get()
  end
end
