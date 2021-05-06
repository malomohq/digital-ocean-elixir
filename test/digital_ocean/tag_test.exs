defmodule DigitalOcean.TagTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Tag, Operation }

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [name: "tag"])
    expected = Map.put(expected, :path, "/tags")

    assert expected == Tag.create(name: "tag")
  end

  test "delete/1" do
    name = "tag"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/tags/#{name}")

    assert expected == Tag.delete(name)
  end

  test "get/1" do
    name = "tag"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/tags/#{name}")

    assert expected == Tag.get(name)
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v", p2: "r"])
    expected = Map.put(expected, :path, "/tags")

    assert expected == Tag.list(p1: "v", p2: "r")
  end

  test "tag_resources/2" do
    name = "mytag"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, resources: [resource_id: "123", resource_name: "mydroplet"])
    expected = Map.put(expected, :path, "/tags/#{name}/resources")

    assert expected == Tag.tag_resources(name, resources: [resource_id: "123", resource_name: "mydroplet"])
  end

  test "untag_resources/2" do
    name = "mytag"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, resources: [resource_id: "123", resource_name: "mydroplet"])
    expected = Map.put(expected, :path, "/tags/#{name}/resources")

    assert expected == Tag.untag_resources(name, resources: [resource_id: "123", resource_name: "mydroplet"])
  end
end
