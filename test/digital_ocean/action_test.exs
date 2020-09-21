defmodule DigitalOcean.ActionTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Action, Operation }

  test "get/1" do
    action_id = 36804636

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/actions/#{action_id}")

    assert expected == Action.get(action_id)
  end

  test "list/1" do
    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/actions")

    assert expected == Action.list(page: page)
  end
end
