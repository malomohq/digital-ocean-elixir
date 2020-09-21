defmodule DigitalOcean.VolumeTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Operation, Volume }

  test "create/1" do
    params = Keyword.new()
    params = Keyword.put(params, :name, "example")
    params = Keyword.put(params, :region, "nyc1")
    params = Keyword.put(params, :size_gigabytes, 10)
    params = Keyword.put(params, :describe, "Example")

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, params)
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.create(params)
  end

  test "create_snapshot/2" do
    volume_id = "82a48a18-873f-11e6-96bf-000f53315a41"

    name = "big-data-snapshot1475261774"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [name: name])
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/snapshots")

    assert expected == Volume.create_snapshot(volume_id, name: name)
  end

  test "delete/1" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}")

    assert expected == Volume.delete(volume_id)
  end

  test "delete_by_name/1" do
    params = Keyword.new()
    params = Keyword.put(params, :name, "example")
    params = Keyword.put(params, :region, "nyc1")

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, params)
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.delete_by_name(params)
  end

  test "get/1" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}")

    assert expected == Volume.get(volume_id)
  end

  test "get_by_name/1" do
    params = Keyword.new()
    params = Keyword.put(params, :name, "example")
    params = Keyword.put(params, :region, "nyc1")

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, params)
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.get_by_name(params)
  end

  test "list/0" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.list()
  end

  test "list_snapshots/1" do
    volume_id = "82a48a18-873f-11e6-96bf-000f53315a41"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/snapshots")

    assert expected == Volume.list_snapshots(volume_id)
  end
end
