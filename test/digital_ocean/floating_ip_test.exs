defmodule DigitalOcean.FloatingIPTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{FloatingIP, Operation}

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/floating_ips")

    assert expected == FloatingIP.create(p1: "v")
  end

  test "delete/1" do
    ip_addr = "45.55.96.47"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/floating_ips/#{ip_addr}")

    assert expected == FloatingIP.delete(ip_addr)
  end

  test "get/1" do
    ip_addr = "45.55.96.47"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/floating_ips/#{ip_addr}")

    assert expected == FloatingIP.get(ip_addr)
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/floating_ips")

    assert expected == FloatingIP.list(p1: "v")
  end
end
