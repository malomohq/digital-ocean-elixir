defmodule DigitalOcean.BillingHistoryTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ BillingHistory, Operation }

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/customers/my/billing_history")

    assert expected == BillingHistory.list(p1: "v")
  end
end
