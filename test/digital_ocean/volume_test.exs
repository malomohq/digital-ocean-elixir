defmodule DigitalOcean.VolumeTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{Operation, Volume}

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.create(p1: "v")
  end

  test "create_snapshot/2" do
    volume_id = "82a48a18-873f-11e6-96bf-000f53315a41"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/snapshots")

    assert expected == Volume.create_snapshot(volume_id, p1: "v")
  end

  test "delete/1" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}")

    assert expected == Volume.delete(volume_id)
  end

  test "delete_by_name/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.delete_by_name(p1: "v")
  end

  test "get/1" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}")

    assert expected == Volume.get(volume_id)
  end

  test "get_by_name/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.get_by_name(p1: "v")
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/volumes")

    assert expected == Volume.list(p1: "v")
  end

  test "list_snapshots/1" do
    volume_id = "82a48a18-873f-11e6-96bf-000f53315a41"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/snapshots")

    assert expected == Volume.list_snapshots(volume_id, p1: "v")
  end
end
