defmodule DigitalOcean.DropletTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Droplet, Operation }

  test "create/1" do
    params = Keyword.new()
    params = Keyword.put(params, :name, "example.com")
    params = Keyword.put(params, :region, "nyc3")
    params = Keyword.put(params, :size, "s-1vcpu-1gb")
    params = Keyword.put(params, :image, "ubuntu-16-04-x64")
    params = Keyword.put(params, :ssh_keys, [107149])
    params = Keyword.put(params, :backups, false)
    params = Keyword.put(params, :ipv6, true)
    params = Keyword.put(params, :tags, ["web"])

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, params)
    expected = Map.put(expected, :path, "/droplets")

    assert expected == Droplet.create(params)
  end

  test "delete/2" do
    droplet_id = 3164494

    tag_name = "awesome"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [tag_name: tag_name])
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}")

    assert expected == Droplet.delete(droplet_id, tag_name: tag_name)
  end

  test "delete_with_all_associated_resources/1" do
    droplet_id = 187000742

    expected = %Operation{}
    expected = Map.put(expected, :headers, [{ "x-dangerous", "true" }])
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/destroy_with_associated_resources/dangerous")

    assert expected == Droplet.delete_with_all_associated_resources(droplet_id)
  end

  test "delete_with_associated_resources/2" do
    droplet_id = 187000742

    snapshots = ["61486916"]

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [snapshots: snapshots])
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/destroy_with_associated_resources/selective")

    assert expected == Droplet.delete_with_associated_resources(droplet_id, snapshots: snapshots)
  end

  test "get/1" do
    droplet_id = 3164494

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}")

    assert expected == Droplet.get(droplet_id)
  end

  test "get_delete_with_associated_resources_status/1" do
    droplet_id = 3164494

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/destroy_with_associated_resources/status")

    assert expected == Droplet.get_delete_with_associated_resources_status(droplet_id)
  end

  test "list/1" do
    tag_name = "awesome"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [tag_name: tag_name])
    expected = Map.put(expected, :path, "/droplets")

    assert expected == Droplet.list(tag_name: tag_name)
  end

  test "list_actions/2" do
    droplet_id = 3164494

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/actions")

    assert expected == Droplet.list_actions(droplet_id, page: page)
  end

  test "list_associated_resources/2" do
    droplet_id = 3164494

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/destroy_with_associated_resources")

    assert expected == Droplet.list_associated_resources(droplet_id, page: page)
  end

  test "list_available_kernels/2" do
    droplet_id = 3164494

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/kernels")

    assert expected == Droplet.list_available_kernels(droplet_id, page: page)
  end

  test "list_backups/2" do
    droplet_id = 3067509

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/backups")

    assert expected == Droplet.list_backups(droplet_id, page: page)
  end

  test "list_for_neightbors" do
    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/droplets/droplet_neighbors_ids")

    assert expected == Droplet.list_for_neightbors(page: page)
  end

  test "list_neighbors/2" do
    droplet_id = 3164494

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/neighbors")

    assert expected == Droplet.list_neighbors(droplet_id, page: page)
  end

  test "list_snapshots/2" do
    droplet_id = 3164494

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/snapshots")

    assert expected == Droplet.list_snapshots(droplet_id, page: page)
  end

  test "retry_delete_with_associated_resources/1" do
    droplet_id = 3164494

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :path, "/droplets/#{droplet_id}/destroy_with_associated_resources/retry")

    assert expected == Droplet.retry_delete_with_associated_resources(droplet_id)
  end
end
