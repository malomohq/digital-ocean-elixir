defmodule DigitalOcean.LoadBalancerTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ LoadBalancer, Operation }

  test "add_droplets/2" do
    load_balancer_id = "4de7ac8b-495b-4884-9a69-1050c6793cd6"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/load_balancers/#{load_balancer_id}/droplets")

    assert expected == LoadBalancer.add_droplets(load_balancer_id, p1: "v")
  end

  test "add_forwarding_rules/2" do
    load_balancer_id = "4de7ac8b-495b-4884-9a69-1050c6793cd6"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/load_balancers/#{load_balancer_id}/forwarding_rules")

    assert expected == LoadBalancer.add_forwarding_rules(load_balancer_id, p1: "v")
  end

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/load_balancers")

    assert expected == LoadBalancer.create(p1: "v")
  end

  test "delete/1" do
    load_balancer_id = "4de7ac8b-495b-4884-9a69-1050c6793cd6"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/load_balancers/#{load_balancer_id}")

    assert expected == LoadBalancer.delete(load_balancer_id)
  end

  test "get/1" do
    load_balancer_id = "4de7ac8b-495b-4884-9a69-1050c6793cd6"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/load_balancers/#{load_balancer_id}")

    assert expected == LoadBalancer.get(load_balancer_id)
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/load_balancers")

    assert expected == LoadBalancer.list(p1: "v")
  end

  test "remove_droplets/2" do
    load_balancer_id = "4de7ac8b-495b-4884-9a69-1050c6793cd6"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/load_balancers/#{load_balancer_id}/droplets")

    assert expected == LoadBalancer.remove_droplets(load_balancer_id, p1: "v")
  end

  test "remove_forwarding_rules/2" do
    load_balancer_id = "4de7ac8b-495b-4884-9a69-1050c6793cd6"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/load_balancers/#{load_balancer_id}/forwarding_rules")

    assert expected == LoadBalancer.remove_forwarding_rules(load_balancer_id, p1: "v")
  end

  test "update/2" do
    load_balancer_id = "de7ac8b-495b-4884-9a69-1050c6793cd6"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/load_balancers/#{load_balancer_id}")

    assert expected == LoadBalancer.update(load_balancer_id, p1: "v")
  end
end
