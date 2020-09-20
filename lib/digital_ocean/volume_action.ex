defmodule DigitalOcean.VolumeAction do
  alias DigitalOcean.{ Operation }

  @doc """
  Attach a volume to a droplet.

  ## Examples

      iex> DigitalOcean.VolumeAction.attach_volume_to_droplet("7724db7c-e098-11e5-b522-000f53304e51", 11612190) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec attach_volume_to_droplet(String.t(), integer, Keyword.t()) :: Operation.t()
  def attach_volume_to_droplet(volume_id, droplet_id, opts \\ []) do
    opts = Keyword.put(opts, :droplet_id, droplet_id)
    opts = Keyword.put(opts, :type, "attach")

    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/#{volume_id}/actions")
  end

  @doc """
  Attach a volume to a droplet by name.

  ## Examples

      iex> DigitalOcean.VolumeAction.attach_volume_to_droplet_by_name("example", 11612190) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec attach_volume_to_droplet_by_name(String.t(), integer, Keyword.t()) :: Operation.t()
  def attach_volume_to_droplet_by_name(volume_name, droplet_id, opts \\ []) do
    opts = Keyword.put(opts, :volume_name, volume_name)
    opts = Keyword.put(opts, :droplet_id, droplet_id)
    opts = Keyword.put(opts, :type, "attach")

    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/actions")
  end

  @doc """
  Retrieve an action that has been executed on a volume.

  ## Examples

      iex> DigitalOcean.VolumeAction.get("7724db7c-e098-11e5-b522-000f53304e51", 72531856)
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t(), integer) :: Operation.t()
  def get(volume_id, action_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/volumes/#{volume_id}/actions/#{action_id}")
  end

  @doc """
  Retrieve a list of all actions that have been executed on a volume.

  ## Examples

      iex> DigitalOcean.VolumeAction.list("7724db7c-e098-11e5-b522-000f53304e51") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(volume_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/#{volume_id}/actions")
  end

  @doc """
  Detach a volume from a droplet.

  ## Examples

      iex> DigitalOcean.VolumeAction.remove_volume_from_droplet("7724db7c-e098-11e5-b522-000f53304e51", 11612190) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec remove_volume_from_droplet(String.t(), integer, Keyword.t()) :: Operation.t()
  def remove_volume_from_droplet(volume_id, droplet_id, opts \\ []) do
    opts = Keyword.put(opts, :droplet_id, droplet_id)
    opts = Keyword.put(opts, :type, "detach")

    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/#{volume_id}/actions")
  end

  @doc """
  Detach a volume from a droplet by name.

  ## Examples

      iex> DigitalOcean.VolumeAction.remove_volume_from_droplet_by_name("example", 11612190) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec remove_volume_from_droplet_by_name(String.t(), integer, Keyword.t()) :: Operation.t()
  def remove_volume_from_droplet_by_name(volume_name, droplet_id, opts \\ []) do
    opts = Keyword.put(opts, :volume_name, volume_name)
    opts = Keyword.put(opts, :droplet_id, droplet_id)
    opts = Keyword.put(opts, :type, "detach")

    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/actions")
  end

  @doc """
  Resize a volume.

  ## Examples

      iex> DigitalOcean.VolumeAction.resize_volume("7724db7c-e098-11e5-b522-000f53304e51", 100) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec resize_volume(String.t(), integer, Keyword.t()) :: Operation.t()
  def resize_volume(volume_id, size_in_gb, opts \\ []) do
    opts = Keyword.put(opts, :size_gigabytes, size_in_gb)
    opts = Keyword.put(opts, :type, "resize")

    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/#{volume_id}/actions")
  end
end
