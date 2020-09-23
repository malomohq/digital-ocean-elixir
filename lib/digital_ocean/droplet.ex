defmodule DigitalOcean.Droplet do
  alias DigitalOcean.{ Operation }

  @doc """
  Create one or more droplets.

  ## Example creating a single droplet

      iex> DigitalOcean.Droplet.create(
      ...>   name: "example.com",
      ...>   region: "nyc3",
      ...>   size: "s-1vcpu-1gb",
      ...>   image: "ubuntu-16-04-x64",
      ...>   ssh_keys: [107149],
      ...>   backups: false,
      ...>   ipv6: true,
      ...>   tags: ["web"]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  ## Example creating multiple droplets

      iex> DigitalOcean.Droplet.create(
      ...>   names: [
      ...>     "sub-01.example.com",
      ...>     "sub-02.example.com",
      ...>   ],
      ...>   region: "nyc3",
      ...>   size: "s-1vcpu-1gb",
      ...>   image: "ubuntu-16-04-x64",
      ...>   ssh_keys: [107149],
      ...>   backups: false,
      ...>   ipv6: true,
      ...>   tags: ["web"]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets")
  end

  @doc """
  Delete a droplet.

  ## Examples

      iex> DigitalOcean.Droplet.delete(3164494) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def delete(droplet_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets/#{droplet_id}")
  end

  @doc """
  Delete a droplet with all associated resources.

  ## Examples

      iex> DigitalOcean.Droplet.delete_with_all_associated_resources(187000742) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_with_all_associated_resources(DigitalOcean.id_t()) :: Operation.t()
  def delete_with_all_associated_resources(droplet_id) do
    %Operation{}
    |> Map.put(:headers, [{ "x-dangerous", "true" }])
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/droplets/#{droplet_id}/destroy_with_associated_resources/dangerous")
  end

  @doc """
  Delete a droplet with a sub-set of associated resources.

  ## Examples

      iex> DigitalOcean.Droplet.delete_with_associated_resources(
      ...>   187000742,
      ...>   snapshots: [
      ...>     "61486916"
      ...>   ],
      ...>   volumes: [
      ...>     "ba49449a-7435-11ea-b89e-0a58ac14480f"
      ...>   ],
      ...>   volume_snapshots: [
      ...>     "edb0478d-7436-11ea-86e6-0a58ac144b91"
      ...>   ]
      ...> )
      ...> { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_with_associated_resources(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def delete_with_associated_resources(droplet_id, opts) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets/#{droplet_id}/destroy_with_associated_resources/selective")
  end

  @doc """
  Retrieve a droplet.

  ## Examples

      iex> DigitalOcean.Droplet.get(3164494) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response() }
  """
  @spec get(DigitalOcean.id_t()) :: Operation.t()
  def get(droplet_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/droplets/#{droplet_id}")
  end

  @doc """
  Retrieve the status of a request to delete a droplet with it's associated
  resources.

  ## Examples
  """
  def get_delete_with_associated_resources_status(droplet_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/droplets/#{droplet_id}/destroy_with_associated_resources/status")
  end

  @doc """
  Retrieve a list of droplets.

  ## Example retrieving droplets

      iex> DigitalOcean.Droplet.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Operation{} }

  ## Example retrieving droplets by tag

      iex> DigitalOcean.Droplet.list(tag_name: "awesome") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets")
  end

  @doc """
  Retrieve a list of actions that have been executed on a droplet.

  ## Examples

      iex> DigitalOcean.Droplet.list_actions(3164494) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_actions(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def list_actions(droplet_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets/#{droplet_id}/actions")
  end

  @doc """
  Retrieve a list of associated billable resources that can be deleted along
  with a droplet.

  ## Examples

      iex> DigitalOcean.Droplet.list_associated_resources(3164494) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_associated_resources(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def list_associated_resources(droplet_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets/#{droplet_id}/destroy_with_associated_resources")
  end

  @doc """
  Retrieve a list of available kernels for a droplet.

  ## Examples

      iex> DigitalOcean.Droplet.list_available_kernels(3164494) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_available_kernels(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def list_available_kernels(droplet_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets/#{droplet_id}/kernels")
  end

  @doc """
  Retrieve a list of backups for a droplet.

  ## Examples

      iex> DigitalOcean.Droplet.list_backups(3067509) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_backups(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def list_backups(droplet_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets/#{droplet_id}/backups")
  end

  @doc """
  Retrieve droplets located on the same physical hardware.

  ## Examples

      iex> DigitalOcean.Droplet.list_for_neightbors() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_for_neightbors(Keyword.t()) :: Operation.t()
  def list_for_neightbors(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets/droplet_neighbors_ids")
  end

  @doc """
  Retrieve a list of neighbors for a droplet.

  ## Examples

      iex> DigitalOcean.Droplet.list_neighbors(3164494) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_neighbors(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def list_neighbors(droplet_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets/#{droplet_id}/neighbors")
  end

  @doc """
  Retrieve a list of snapshots for a droplet.

  ## Examples

      iex> DigitalOcean.Droplet.list_snapshots(3164494) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_snapshots(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def list_snapshots(droplet_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets/#{droplet_id}/snapshots")
  end

  @doc """
  Retry deleting a droplet with associated resources.

  ## Examples

      iex> DigitalOcean.Droplet.retry_delete_with_associated_resources(3164494) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec retry_delete_with_associated_resources(DigitalOcean.id_t()) :: Operation.t()
  def retry_delete_with_associated_resources(droplet_id) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:path, "/droplets/#{droplet_id}/destroy_with_associated_resources/retry")
  end
end
