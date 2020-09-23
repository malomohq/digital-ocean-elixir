defmodule DigitalOcean.KubernetesCluster do
  alias DigitalOcean.{ Operation }

  @doc """
  Create a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.create(
      ...>   name: "prod-cluster-01",
      ...>   region: "nyc1",
      ...>   version: "1.14.1-do.4",
      ...>   tags: ["production", "web-team"],
      ...>   node_pools: [
      ...>     %{
      ...>       size: "s-1vcpu-2gb",
      ...>       count: 3,
      ...>       name: "frontend-pool",
      ...>       tags: ["frontend"],
      ...>       labels: %{
      ...>         service: "frontend",
      ...>         priority: "hi"
      ...>       }
      ...>     }
      ...>   ]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/kubernetes/clusters")
  end

  @doc """
  Create a node pool for a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.create_node_pool(
      ...>   "d5f5959-5e1e-4205-a714-a914373942af",
      ...>   size: "s-2vcpu-4gb",
      ...>   count: 1,
      ...>   name: "pool-02",
      ...>   tags: ["web"],
      ...>   labels: %{
      ...>     service: "web",
      ...>     priority: "high"
      ...>   }
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create_node_pool(String.t(), Keyword.t()) :: Operation.t()
  def create_node_pool(cluster_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}/node_pools")
  end

  @doc """
  Delete a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.delete("bd5f5959-5e1e-4205-a714-a914373942af") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(cluster_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}")
  end

  @doc """
  Delete a node from a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.delete_node(
      ...>   "bd5f5959-5e1e-4205-a714-a914373942af",
      ...>   "86c9bc8c-b2c3-4d40-8000-b0c7bee27305",
      ...>   "478247f8-b1bb-4f7a-8db9-2a5f8d4b8f8f",
      ...>   skip_drain: 0,
      ...>   replace: 1
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_node(String.t(), String.t(), String.t(), Keyword.t()) :: Operation.t()
  def delete_node(cluster_id, node_pool_id, node_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}/node_pools/#{node_pool_id}/nodes/#{node_id}")
  end

  @doc """
  Delete a node pool from a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.delete_node_pool(
      ...>   "bd5f5959-5e1e-4205-a714-a914373942af",
      ...>   "86c9bc8c-b2c3-4d40-8000-b0c7bee27305"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_node_pool(String.t(), String.t()) :: Operation.t()
  def delete_node_pool(cluster_id, node_pool_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}/node_pools/#{node_pool_id}")
  end

  @doc """
  Retrieve a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.get("bd5f5959-5e1e-4205-a714-a914373942af") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t()) :: Operation.t()
  def get(cluster_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}")
  end

  @doc """
  Retrieve clusterlint diagnostics for a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.get_clusterlint_diagnostics("bd5f5959-5e1e-4205-a714-a914373942af") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_clusterlint_diagnostics(String.t(), Keyword.t()) :: Operation.t()
  def get_clusterlint_diagnostics(cluster_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}/clusterlint")
  end

  @doc """
  Retrieve credentials for a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.get_credentials("bd5f5959-5e1e-4205-a714-a914373942af") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_credentials(String.t()) :: Operation.t()
  def get_credentials(cluster_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}")
  end

  @doc """
  Retrieve the kubeconfig for a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.get_kubeconfig("bd5f5959-5e1e-4205-a714-a914373942af") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_kubeconfig(String.t()) :: Operation.t()
  def get_kubeconfig(cluster_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}/kubeconfig")
  end

  @doc """
  Retrieve a node pool for a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.get_node_pool(
      ...>   "bd5f5959-5e1e-4205-a714-a914373942af",
      ...>   "cdda885e-7663-40c8-bc74-3a036c66545d"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_node_pool(String.t(), String.t()) :: Operation.t()
  def get_node_pool(cluster_id, node_pool_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}/node_pools/#{node_pool_id}")
  end

  @doc """
  Retrieve supported Kubernetes versions, available regions and available node
  sizes.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.get_options()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_options :: Operation.t()
  def get_options do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/kubernetes/clusters/options")
  end

  @doc """
  Retrieve available updates for a cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.get_upgrades("bd5f5959-5e1e-4205-a714-a914373942af") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_upgrades(String.t()) :: Operation.t()
  def get_upgrades(cluster_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}/upgrades")
  end

  @doc """
  Retrieve a list of Kubernetes clusters.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.lists() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/kubernetes/clusters")
  end

  @doc """
  Retrieve a list of node pools for a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.list_node_pools("bd5f5959-5e1e-4205-a714-a914373942af") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_node_pools(String.t(), Keyword.t()) :: Operation.t()
  def list_node_pools(cluster_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}/node_pools")
  end

  @doc """
  Run clusterlink checks on a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.run_clusterlint(
      ...>   "bd5f5959-5e1e-4205-a714-a914373942af",
      ...>   include_groups: ["basic"],
      ...>   include_checks: "bare-pods"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec run_clusterlint(String.t(), Keyword.t()) :: Operation.t()
  def run_clusterlint(cluster_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}/clusterlint")
  end

  @doc """
  Update a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.update(
      ...>   "bd5f5959-5e1e-4205-a714-a914373942af",
      ...>   name: "stage-cluster-01",
      ...>   tags: ["staging", "web-team"]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update(String.t(), Keyword.t()) :: Operation.t()
  def update(cluster_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}")
  end

  @doc """
  Update a node pool for a Kubernetes cluster.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.update_node_pool(
      ...>   "bd5f5959-5e1e-4205-a714-a914373942af",
      ...>   "86c9bc8c-b2c3-4d40-8000-b0c7bee27305",
      ...>   name: "frontend",
      ...>   count: 1,
      ...>   tags: ["frontend"],
      ...>   labels: %{
      ...>     service: "frontend",
      ...>     priority: "high"
      ...>   }
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update_node_pool(String.t(), String.t(), Keyword.t()) :: Operation.t()
  def update_node_pool(cluster_id, node_pool_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}/node_pools/#{node_pool_id}")
  end

  @doc """
  Update a Kubernetes cluster to a newer patch release of Kubernetes.

  ## Examples

      iex> DigitalOcean.KubernetesCluster.upgrade(
      ...>   "bd5f5959-5e1e-4205-a714-a914373942af",
      ...>   version: "1.12.3-do.1"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec upgrade(String.t(), Keyword.t()) :: Operation.t()
  def upgrade(cluster_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/kubernetes/clusters/#{cluster_id}/upgrade")
  end
end
