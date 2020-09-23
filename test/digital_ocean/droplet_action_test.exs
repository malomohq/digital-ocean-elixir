defmodule DigitalOcean.DropletActionTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ DropletAction, Operation }

  test "create/2" do
    droplet_id = 3164450

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/actions")

    assert expected == DropletAction.create(droplet_id, p1: "v")
  end

  test "create_by_tag_name" do
    tag_name = "awesome"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :path, "/droplets/actions?tag_name=#{tag_name}")

    assert expected == DropletAction.create_by_tag_name(tag_name)
  end

  test "get/2" do
    droplet_id = 3164444

    action_id = 3164444

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/actions/#{action_id}")

    assert expected == DropletAction.get(droplet_id, action_id)
  end
end
