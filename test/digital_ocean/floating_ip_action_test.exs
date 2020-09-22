defmodule DigitalOcean.FloatingIPActionTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ FloatingIPAction, Operation }

  test "create/2" do
    ip_addr = "45.55.96.47"

    params = Keyword.new()
    params = Keyword.put(params, :type, "assign")
    params = Keyword.put(params, :droplet_id, 8219222)

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, params)
    expected = Map.put(expected, :path, "/floating_ips/#{ip_addr}/actions")

    assert expected == FloatingIPAction.create(ip_addr, params)
  end

  test "get/2" do
    ip_addr = "45.55.96.47"

    action_id = 72531856

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/floating_ips/#{ip_addr}/actions/#{action_id}")

    assert expected == FloatingIPAction.get(ip_addr, action_id)
  end

  test "list/2" do
    ip_addr = "45.55.96.47"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/floating_ips/#{ip_addr}/actions")

    assert expected == FloatingIPAction.list(ip_addr, page: page)
  end
end
