defmodule DigitalOcean.FloatingIPActionTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{FloatingIPAction, Operation}

  test "create/2" do
    ip_addr = "45.55.96.47"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/floating_ips/#{ip_addr}/actions")

    assert expected == FloatingIPAction.create(ip_addr, p1: "v")
  end

  test "get/2" do
    ip_addr = "45.55.96.47"

    action_id = 72_531_856

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/floating_ips/#{ip_addr}/actions/#{action_id}")

    assert expected == FloatingIPAction.get(ip_addr, action_id)
  end

  test "list/2" do
    ip_addr = "45.55.96.47"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/floating_ips/#{ip_addr}/actions")

    assert expected == FloatingIPAction.list(ip_addr, p1: "v")
  end
end
