defmodule DigitalOcean.KubernetesClusterClusterTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ KubernetesCluster, Operation }

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/kubernetes/clusters")

    assert expected == KubernetesCluster.create(p1: "v")
  end

  test "create_node_pool/2" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}/node_pools")

    assert expected == KubernetesCluster.create_node_pool(cluster_id, p1: "v")
  end

  test "delete/1" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}")

    assert expected == KubernetesCluster.delete(cluster_id)
  end

  test "delete_node/4" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    node_pool_id = "86c9bc8c-b2c3-4d40-8000-b0c7bee27305"

    node_id = "478247f8-b1bb-4f7a-8db9-2a5f8d4b8f8f"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}/node_pools/#{node_pool_id}/nodes/#{node_id}")

    assert expected == KubernetesCluster.delete_node(cluster_id, node_pool_id, node_id, p1: "v")
  end

  test "delete_node_pool/2" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    node_pool_id = "86c9bc8c-b2c3-4d40-8000-b0c7bee27305"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}/node_pools/#{node_pool_id}")

    assert expected == KubernetesCluster.delete_node_pool(cluster_id, node_pool_id)
  end

  test "get/1" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}")

    assert expected == KubernetesCluster.get(cluster_id)
  end

  test "get_clusterlint_diagnostics/2" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}/clusterlint")

    assert expected == KubernetesCluster.get_clusterlint_diagnostics(cluster_id, p1: "v")
  end

  test "get_credentials/1" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}")

    assert expected == KubernetesCluster.get_credentials(cluster_id)
  end

  test "get_kubeconfig/1" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}/kubeconfig")

    assert expected == KubernetesCluster.get_kubeconfig(cluster_id)
  end

  test "get_node_pool/2" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    node_pool_id = "cdda885e-7663-40c8-bc74-3a036c66545d"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}/node_pools/#{node_pool_id}")

    assert expected == KubernetesCluster.get_node_pool(cluster_id, node_pool_id)
  end

  test "get_options/0" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/kubernetes/clusters/options")

    assert expected == KubernetesCluster.get_options()
  end

  test "get_upgrades/1" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}/upgrades")

    assert expected == KubernetesCluster.get_upgrades(cluster_id)
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/kubernetes/clusters")

    assert expected == KubernetesCluster.list(p1: "v")
  end

  test "list_node_pools/2" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}/node_pools")

    assert expected == KubernetesCluster.list_node_pools(cluster_id, p1: "v")
  end

  test "run_clusterlint/2" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}/clusterlint")

    assert expected == KubernetesCluster.run_clusterlint(cluster_id, p1: "v")
  end

  test "update/2" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}")

    assert expected == KubernetesCluster.update(cluster_id, p1: "v")
  end

  test "update_node_pool/3" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    node_pool_id = "86c9bc8c-b2c3-4d40-8000-b0c7bee27305"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}/node_pools/#{node_pool_id}")

    assert expected == KubernetesCluster.update_node_pool(cluster_id, node_pool_id, p1: "v")
  end

  test "upgrade/2" do
    cluster_id = "bd5f5959-5e1e-4205-a714-a914373942af"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/kubernetes/clusters/#{cluster_id}/upgrade")

    assert expected == KubernetesCluster.upgrade(cluster_id, p1: "v")
  end
end
