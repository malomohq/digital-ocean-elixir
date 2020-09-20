defmodule DigitalOcean.VolumeTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Operation, Volume }

  test "create/4" do
    name = "example"

    region = "nyc1"

    size_in_gb = 10

    description = "Example"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [size_gigabytes: size_in_gb, region: region, name: name, description: description])
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.create(name, region, size_in_gb, description: description)
  end

  test "create_snapshot/3" do
    volume_id = "82a48a18-873f-11e6-96bf-000f53315a41"

    name = "big-data-snapshot1475261774"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [name: name])
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/snapshots")

    assert expected == Volume.create_snapshot(volume_id, name)
  end

  test "delete/1" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}")

    assert expected == Volume.delete(volume_id)
  end

  test "delete_by_name/2" do
    name = "example"

    region = "nyc1"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [region: region, name: name])
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.delete_by_name(name, region)
  end

  test "get/1" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}")

    assert expected == Volume.get(volume_id)
  end

  test "get_by_name/2" do
    name = "example"

    region = "nyc1"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [region: region, name: name])
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.get_by_name(name, region)
  end

  test "list/0" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.list()
  end

  test "list_snapshots/2" do
    volume_id = "82a48a18-873f-11e6-96bf-000f53315a41"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/snapshots")

    assert expected == Volume.list_snapshots(volume_id)
  end
end
