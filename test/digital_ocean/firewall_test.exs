defmodule DigitalOcean.FirewallTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Firewall, Operation }

  test "add_droplets/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/droplets")

    assert expected == Firewall.add_droplets(firewall_id, p1: "v")
  end

  test "add_rules/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/rules")

    assert expected == Firewall.add_rules(firewall_id, p1: "v")
  end

  test "add_tags/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/tags")

    assert expected == Firewall.add_tags(firewall_id, p1: "v")
  end

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/firewalls")

    assert expected == Firewall.create(p1: "v")
  end

  test "delete/1" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}")

    assert expected == Firewall.delete(firewall_id)
  end

  test "get/1" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}")

    assert expected == Firewall.get(firewall_id)
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/firewalls")

    assert expected == Firewall.list(p1: "v")
  end

  test "remove_droplets/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/droplets")

    assert expected == Firewall.remove_droplets(firewall_id, p1: "v")
  end

  test "remove_rules/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/rules")

    assert expected == Firewall.remove_rules(firewall_id, p1: "v")
  end

  test "remove_tags/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/tags")

    assert expected == Firewall.remove_tags(firewall_id, p1: "v")
  end

  test "update/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}")

    assert expected == Firewall.update(firewall_id, p1: "v")
  end
end
