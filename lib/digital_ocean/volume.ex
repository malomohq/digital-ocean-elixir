defmodule DigitalOcean.Volume do
  alias DigitalOcean.{ Operation }

  @doc """
  Create a volume.

  ## Examples

      iex> DigitalOcean.Volume.create(
      ...>   name: "example",
      ...>   region: "nyc1",
      ...>   size_gigabytes: 10
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes")
  end

  @doc """
  Create a snapshot from a volume.

  ## Examples

      iex> DigitalOcean.Volume.create_snapshot(
      ...>   "82a48a18-873f-11e6-96bf-000f53315a41",
      ...>   name: "big-data-snapshot1475261774"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create_snapshot(String.t(), Keyword.t()) :: Operation.t()
  def create_snapshot(volume_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/#{volume_id}/snapshots")
  end

  @doc """
  Delete a volume.

  ## Examples

      iex> DigitalOcean.Volume.delete("7724db7c-e098-11e5-b522-000f53304e51") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(volume_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/volumes/#{volume_id}")
  end

  @doc """
  Delete a volume by name.

  ## Examples

      iex> DigitalOcean.Volume.delete_by_name(
      ...>   name: "example",
      ...>   region: "nyc1"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_by_name(Keyword.t()) :: Operation.t()
  def delete_by_name(opts) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes")
  end

  @doc """
  Retrieve details about a specific volume.

  ## Examples

      iex> DigitalOcean.Volume.get("7724db7c-e098-11e5-b522-000f53304e51") |> DigitalOcean.request()
      { :ok, DigitalOcean.Response{} }
  """
  @spec get(String.t()) :: Operation.t()
  def get(volume_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/volumes/#{volume_id}")
  end

  @doc """
  Retrieve details about a specific volume by name.

  ## Example

      iex> DigitalOcean.Volume.get(
      ...>   name: "example",
      ...>   region: "nyc1"
      ...> ) > DigitalOcean.request()
      { :ok, DigitalOcean.Response{} }
  """
  @spec get_by_name(Keyword.t()) :: Operation.t()
  def get_by_name(opts) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes")
  end

  @doc """
  Retrieve a list of volumes available on your account.

  ## Examples

      iex> DigitalOcean.Volume.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes")
  end

  @doc """
  Retrieve a list of snapshots for a volume.

  ## Examples

      iex> DigitalOcean.Volume.list_snapshots("82a48a18-873f-11e6-96bf-000f53315a41") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_snapshots(String.t()) :: Operation.t()
  def list_snapshots(volume_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/#{volume_id}/snapshots")
  end
end
