defmodule DigitalOcean.VolumeActionTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{Operation, VolumeAction}

  test "create/2" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/actions")

    assert expected == VolumeAction.create(volume_id, p1: "v")
  end

  test "create_by_name/2" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/volumes/actions")

    assert expected == VolumeAction.create_by_name(p1: "v")
  end

  test "get/2" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    action_id = 72_531_856

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/actions/#{action_id}")

    assert expected == VolumeAction.get(volume_id, action_id)
  end

  test "lits/2" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/actions")

    assert expected == VolumeAction.list(volume_id, p1: "v")
  end
end
