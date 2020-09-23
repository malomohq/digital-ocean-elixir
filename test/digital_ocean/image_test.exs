defmodule DigitalOcean.ImageTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Image, Operation }

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/images")

    assert expected == Image.create(p1: "v")
  end

  test "delete/1" do
    image_id = 7938391

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/images/#{image_id}")

    assert expected == Image.delete(image_id)
  end

  test "get/1" do
    image_id = 7555620

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/images/#{image_id}")

    assert expected == Image.get(image_id)
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/images")

    assert expected == Image.list(p1: "v")
  end

  test "update/2" do
    image_id = 7938391

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/images/#{image_id}")

    assert expected == Image.update(image_id, p1: "v")
  end
end
