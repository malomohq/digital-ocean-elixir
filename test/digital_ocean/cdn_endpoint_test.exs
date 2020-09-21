defmodule DigitalOcean.CDNEndpointTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ CDNEndpoint, Operation }

  test "create/2" do
    origin = "static-images.nyc3.digitaloceanspaces.com"

    ttl = 3600

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [origin: origin, ttl: ttl])
    expected = Map.put(expected, :path, "/cdn/endpoints")

    assert expected == CDNEndpoint.create(origin: origin, ttl: ttl)
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
    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/cdn/endpoints")

    assert expected == CDNEndpoint.list(page: page)
  end

  test "purge_cache/2" do
    endpoint_id = "19f06b6a-3ace-4315-b086-499a0e521b76"

    files = ["*"]

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [files: files])
    expected = Map.put(expected, :path, "/cdn/endpoints/#{endpoint_id}/cache")

    assert expected == CDNEndpoint.purge_cache(endpoint_id, files: files)
  end

  test "update/2" do
    endpoint_id = "19f06b6a-3ace-4315-b086-499a0e521b76"

    ttl = 1800

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [ttl: ttl])
    expected = Map.put(expected, :path, "/cdn/endpoints/#{endpoint_id}")

    assert expected == CDNEndpoint.update(endpoint_id, ttl: ttl)
  end
end
