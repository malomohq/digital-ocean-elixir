defmodule DigitalOcean.DropletTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{Droplet, Operation}

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/droplets")

    assert expected == Droplet.create(p1: "v")
  end

  test "delete/2" do
    droplet_id = 3_164_494

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}")

    assert expected == Droplet.delete(droplet_id, p1: "v")
  end

  test "delete_with_all_associated_resources/1" do
    droplet_id = 187_000_742

    expected = %Operation{}
    expected = Map.put(expected, :headers, [{"x-dangerous", "true"}])
    expected = Map.put(expected, :method, :delete)

    expected =
      Map.put(
        expected,
        :path,
        "/droplets/#{droplet_id}/destroy_with_associated_resources/dangerous"
      )

    assert expected == Droplet.delete_with_all_associated_resources(droplet_id)
  end

  test "delete_with_associated_resources/2" do
    droplet_id = 187_000_742

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, p1: "v")

    expected =
      Map.put(
        expected,
        :path,
        "/droplets/#{droplet_id}/destroy_with_associated_resources/selective"
      )

    assert expected == Droplet.delete_with_associated_resources(droplet_id, p1: "v")
  end

  test "get/1" do
    droplet_id = 3_164_494

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}")

    assert expected == Droplet.get(droplet_id)
  end

  test "get_delete_with_associated_resources_status/1" do
    droplet_id = 3_164_494

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)

    expected =
      Map.put(expected, :path, "/droplets/#{droplet_id}/destroy_with_associated_resources/status")

    assert expected == Droplet.get_delete_with_associated_resources_status(droplet_id)
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/droplets")

    assert expected == Droplet.list(p1: "v")
  end

  test "list_actions/2" do
    droplet_id = 3_164_494

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/actions")

    assert expected == Droplet.list_actions(droplet_id, p1: "v")
  end

  test "list_associated_resources/2" do
    droplet_id = 3_164_494

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")

    expected =
      Map.put(expected, :path, "/droplets/#{droplet_id}/destroy_with_associated_resources")

    assert expected == Droplet.list_associated_resources(droplet_id, p1: "v")
  end

  test "list_available_kernels/2" do
    droplet_id = 3_164_494

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/kernels")

    assert expected == Droplet.list_available_kernels(droplet_id, p1: "v")
  end

  test "list_backups/2" do
    droplet_id = 3_067_509

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/backups")

    assert expected == Droplet.list_backups(droplet_id, p1: "v")
  end

  test "list_for_neightbors" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/droplets/droplet_neighbors_ids")

    assert expected == Droplet.list_for_neightbors(p1: "v")
  end

  test "list_neighbors/2" do
    droplet_id = 3_164_494

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/neighbors")

    assert expected == Droplet.list_neighbors(droplet_id, p1: "v")
  end

  test "list_snapshots/2" do
    droplet_id = 3_164_494

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/snapshots")

    assert expected == Droplet.list_snapshots(droplet_id, p1: "v")
  end

  test "retry_delete_with_associated_resources/1" do
    droplet_id = 3_164_494

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)

    expected =
      Map.put(expected, :path, "/droplets/#{droplet_id}/destroy_with_associated_resources/retry")

    assert expected == Droplet.retry_delete_with_associated_resources(droplet_id)
  end
end
