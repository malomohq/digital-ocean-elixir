defmodule DigitalOcean.VolumeActionTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Operation, VolumeAction }

  test "attach_volume_to_droplet/3" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    droplet_id = 11612190

    region = "nyc1"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [type: "attach", droplet_id: droplet_id, region: region])
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/actions")

    assert expected == VolumeAction.attach_volume_to_droplet(volume_id, droplet_id, region: region)
  end

  test "attach_volume_to_droplet_by_name/3" do
    volume_name = "example"

    droplet_id = 11612190

    region = "nyc1"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [type: "attach", droplet_id: droplet_id, volume_name: volume_name, region: region])
    expected = Map.put(expected, :path, "/volumes/actions")

    assert expected == VolumeAction.attach_volume_to_droplet_by_name(volume_name, droplet_id, region: region)
  end

  test "get/2" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    action_id = 72531856

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/actions/#{action_id}")

    assert expected == VolumeAction.get(volume_id, action_id)
  end

  test "list/2" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/actions")

    assert expected == VolumeAction.list(volume_id, page: page)
  end

  test "remove_volume_from_droplet/3" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    droplet_id = 11612190

    region = "nyc1"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [type: "detach", droplet_id: droplet_id, region: region])
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/actions")

    assert expected == VolumeAction.remove_volume_from_droplet(volume_id, droplet_id, region: region)
  end

  test "remove_volume_from_droplet_by_name/3" do
    volume_name = "example"

    droplet_id = 11612190

    region = "nyc1"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [type: "detach", droplet_id: droplet_id, volume_name: volume_name, region: region])
    expected = Map.put(expected, :path, "/volumes/actions")

    assert expected == VolumeAction.remove_volume_from_droplet_by_name(volume_name, droplet_id, region: region)
  end

  test "resize_volume/3" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    size_in_gb = 100

    region = "nyc1"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [type: "resize", size_gigabytes: size_in_gb, region: region])
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/actions")

    assert expected == VolumeAction.resize_volume(volume_id, size_in_gb, region: region)
  end
end
