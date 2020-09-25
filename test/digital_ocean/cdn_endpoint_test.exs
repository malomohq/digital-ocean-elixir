defmodule DigitalOcean.CDNEndpointTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{CDNEndpoint, Operation}

  test "create/2" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/cdn/endpoints")

    assert expected == CDNEndpoint.create(p1: "v")
  end

  test "delete/1" do
    endpoint_id = "19f06b6a-3ace-4315-b086-499a0e521b76"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/cdn/endpoints/#{endpoint_id}")

    assert expected == CDNEndpoint.delete(endpoint_id)
  end

  test "get/1" do
    endpoint_id = "19f06b6a-3ace-4315-b086-499a0e521b76"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/cdn/endpoints/#{endpoint_id}")

    assert expected == CDNEndpoint.get(endpoint_id)
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/cdn/endpoints")

    assert expected == CDNEndpoint.list(p1: "v")
  end

  test "purge_cache/2" do
    endpoint_id = "19f06b6a-3ace-4315-b086-499a0e521b76"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/cdn/endpoints/#{endpoint_id}/cache")

    assert expected == CDNEndpoint.purge_cache(endpoint_id, p1: "v")
  end

  test "update/2" do
    endpoint_id = "19f06b6a-3ace-4315-b086-499a0e521b76"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/cdn/endpoints/#{endpoint_id}")

    assert expected == CDNEndpoint.update(endpoint_id, p1: "v")
  end
end
