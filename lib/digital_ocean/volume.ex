defmodule DigitalOcean.Volume do
  alias DigitalOcean.{ Operation }

  @doc """
  Create a volume.

  ## Examples

      iex> DigitalOcean.Volume.create("example", "nyc1", 10) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(String.t(), String.t(), integer, Keyword.t()) :: Operation.t()
  def create(name, region, size_in_gb, opts \\ []) do
    opts = Keyword.put(opts, :name, name)
    opts = Keyword.put(opts, :region, region)
    opts = Keyword.put(opts, :size_gigabytes, size_in_gb)

    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes")
  end

  @doc """
  Create a snapshot from a volume.

  ## Examples

      iex> DigitalOcean.Volume.create_snapshot("82a48a18-873f-11e6-96bf-000f53315a41", "big-data-snapshot1475261774")
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create_snapshot(String.t(), String.t(), Keyword.t()) :: Operation.t()
  def create_snapshot(volume_id, name, opts \\ []) do
    opts = Keyword.put(opts, :name, name)

    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/#{volume_id}/snapshots")
  end

  @doc """
  Delete a volume.

  ## Examples

      iex> DigitalOcean.Volume.delete("7724db7c-e098-11e5-b522-000f53304e51")
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

      iex> DigitalOcean.Volume.delete_by_name("example", "nyc1")
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_by_name(String.t(), String.t()) :: Operation.t()
  def delete_by_name(name, region) do
    params = Keyword.new()
    params = Keyword.put(params, :name, name)
    params = Keyword.put(params, :region, region)

    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params, params)
    |> Map.put(:path, "/volumes")
  end

  @doc """
  Retrieve details about a specific volume.

  ## Examples

      iex> DigitalOcean.Volume.get("7724db7c-e098-11e5-b522-000f53304e51")
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

      iex> DigitalOcean.Volume.get("example", "nyc1") > DigitalOcean.request()
      { :ok, DigitalOcean.Response{} }
  """
  @spec get_by_name(String.t(), String.t()) :: Operation.t()
  def get_by_name(name, region) do
    params = Keyword.new()
    params = Keyword.put(params, :name, name)
    params = Keyword.put(params, :region, region)

    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, params)
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
