defmodule DigitalOcean.FirewallTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Firewall, Operation }

  test "add_droplets/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    droplet_id = 49696269

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [droplet_ids: [droplet_id]])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/droplets")

    assert expected == Firewall.add_droplets(firewall_id, droplet_ids: [droplet_id])
  end

  test "add_rules/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    rule = Map.new()
    rule = Map.put(rule, :protocol, "tcp")
    rule = Map.put(rule, :ports, "3306")
    rule = Map.put(rule, :sources, %{ droplet_ids: [49696269] })

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [inbound_rules: [rule], outbound_rules: [rule]])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/rules")

    assert expected == Firewall.add_rules(firewall_id, inbound_rules: [rule], outbound_rules: [rule])
  end

  test "add_tags/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    tag = "frontend"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [tags: [tag]])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/tags")

    assert expected == Firewall.add_tags(firewall_id, tags: [tag])
  end

  test "create/1" do
    name = "firewall"

    inbound_rule = Map.new()
    inbound_rule = Map.put(inbound_rule, :protocol, "tcp")
    inbound_rule = Map.put(inbound_rule, :ports, "80")
    inbound_rule = Map.put(inbound_rule, :sources, [load_balancer_uids: "4de7ac8b-495b-4884-9a69-1050c6793cd6"])

    outbound_rule = Map.new()
    outbound_rule = Map.put(outbound_rule, :protocol, "tcp")
    outbound_rule = Map.put(outbound_rule, :ports, "80")
    outbound_rule = Map.put(outbound_rule, :destinations, [addresses: ["0.0.0.0/0", "::/0"]])

    droplet_id = 8043964

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [name: name, inbound_rules: [inbound_rule], outbound_rules: [outbound_rule], droplet_ids: [droplet_id]])
    expected = Map.put(expected, :path, "/firewalls")

    assert expected == Firewall.create(name: name, inbound_rules: [inbound_rule], outbound_rules: [outbound_rule], droplet_ids: [droplet_id])
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
    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/firewalls")

    assert expected == Firewall.list(page: page)
  end

  test "remove_droplets/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    droplet_id = 49696269

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [droplet_ids: [droplet_id]])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/droplets")

    assert expected == Firewall.remove_droplets(firewall_id, droplet_ids: [droplet_id])
  end

  test "remove_rules/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    rule = Map.new()
    rule = Map.put(rule, :protocol, "tcp")
    rule = Map.put(rule, :ports, "3306")
    rule = Map.put(rule, :sources, %{ droplet_ids: [49696269] })

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [inbound_rules: [rule], outbound_rules: [rule]])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/rules")

    assert expected == Firewall.remove_rules(firewall_id, inbound_rules: [rule], outbound_rules: [rule])
  end

  test "remove_tags/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    tag = "frontend"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [tags: [tag]])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}/tags")

    assert expected == Firewall.remove_tags(firewall_id, tags: [tag])
  end

  test "update/2" do
    firewall_id = "bb4b2611-3d72-467b-8602-280330ecd65c"

    name = "firewall"

    inbound_rule = Map.new()
    inbound_rule = Map.put(inbound_rule, :protocol, "tcp")
    inbound_rule = Map.put(inbound_rule, :ports, "80")
    inbound_rule = Map.put(inbound_rule, :sources, [load_balancer_uids: "4de7ac8b-495b-4884-9a69-1050c6793cd6"])

    outbound_rule = Map.new()
    outbound_rule = Map.put(outbound_rule, :protocol, "tcp")
    outbound_rule = Map.put(outbound_rule, :ports, "80")
    outbound_rule = Map.put(outbound_rule, :destinations, [addresses: ["0.0.0.0/0", "::/0"]])

    droplet_id = 8043964

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [name: name, inbound_rules: [inbound_rule], outbound_rules: [outbound_rule], droplet_ids: [droplet_id]])
    expected = Map.put(expected, :path, "/firewalls/#{firewall_id}")

    assert expected == Firewall.update(firewall_id, name: name, inbound_rules: [inbound_rule], outbound_rules: [outbound_rule], droplet_ids: [droplet_id])
  end
end
