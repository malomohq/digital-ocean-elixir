defmodule DigitalOcean.BillingHistoryTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ BillingHistory, Operation }

  test "list/1" do
    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/customers/my/billing_history")

    assert expected == BillingHistory.list(page: page)
  end
end
