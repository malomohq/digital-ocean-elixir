defmodule DigitalOcean.ImageTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Image, Operation }

  test "create/1" do
    params = Keyword.new()
    params = Keyword.put(params, :name, "ubuntu-18.04-minimal")
    params = Keyword.put(params, :url, "http://cloud-images.ubuntu.com/minimal/releases/bionic/release/ubuntu-18.04-minimal-cloudimg-amd64.img")
    params = Keyword.put(params, :distribution, "Ubuntu")
    params = Keyword.put(params, :region, "nyc3")
    params = Keyword.put(params, :description, "Cloud-optimized image w/ small footprint")
    params = Keyword.put(params, :tags, ["base-image", "prod"])

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, params)
    expected = Map.put(expected, :path, "/images")

    assert expected == Image.create(params)
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
    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/images")

    assert expected == Image.list(page: page)
  end

  test "update/2" do
    image_id = 7938391

    name = "new-image-name"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [name: name])
    expected = Map.put(expected, :path, "/images/#{image_id}")

    assert expected == Image.update(image_id, name: name)
  end
end
