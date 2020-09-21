defmodule DigitalOcean.VolumeActionTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Operation, VolumeAction }

  test "create/2" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    params = Keyword.new()
    params = Keyword.put(params, :type, "attach")
    params = Keyword.put(params, :droplet_id, 11612190)
    params = Keyword.put(params, :region, "nyc1")
    params = Keyword.put(params, :tags, ["aninterestingtag"])

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, params)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/actions")

    assert expected == VolumeAction.create(volume_id, params)
  end

  test "create_by_name/2" do
    params = Keyword.new()
    params = Keyword.put(params, :type, "attach")
    params = Keyword.put(params, :volume_name, "example")
    params = Keyword.put(params, :region, "nyc1")
    params = Keyword.put(params, :droplet_id, 11612190)
    params = Keyword.put(params, :tags, ["aninterestingname"])

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, params)
    expected = Map.put(expected, :path, "/volumes/actions")

    assert expected == VolumeAction.create_by_name(params)
  end

  test "get/2" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    action_id = 72531856

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/actions/#{action_id}")

    assert expected == VolumeAction.get(volume_id, action_id)
  end

  test "lits/2" do
    volume_id = "7724db7c-e098-11e5-b522-000f53304e51"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/volumes/#{volume_id}/actions")

    assert expected == VolumeAction.list(volume_id, page: page)
  end
end
