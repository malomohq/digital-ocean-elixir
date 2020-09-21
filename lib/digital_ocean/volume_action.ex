defmodule DigitalOcean.VolumeAction do
  alias DigitalOcean.{ Operation }

  @doc """
  Create an action for a volume.

  ## Example for attaching a volume to a droplet

      iex> DigitalOcean.VolumeAction.create(
      ...>   "7724db7c-e098-11e5-b522-000f53304e51",
      ...>   type: "attach",
      ...>   droplet_id: 11612190,
      ...>   region: "nyc1",
      ...>   tags: ["aninterestingtag"]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  ## Example for removing a volume from a droplet

      iex> DigitalOcean.VolumeAction.create(
      ...>   "7724db7c-e098-11e5-b522-000f53304e51",
      ...>   type: "detach",
      ...>   droplet_id: 11612190,
      ...>   region: "nyc1"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  ## Example for resizing a volume

      iex> DigitalOcean.VolumeAction.create(
      ...>   "7724db7c-e098-11e5-b522-000f53304e51",
      ...>   type: "resize",
      ...>   size_gigabytes: 100,
      ...>   region: "nyc1"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(String.t(), Keyword.t()) :: Operation.t()
  def create(volume_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/#{volume_id}/actions")
  end

  @doc """
  Create an action for a volume by name.

  ## Example for attaching a volume to a droplet

      iex> DigitalOcean.VolumeAction.create(
      ...>   type: "attach",
      ...>   volume_name: "example",
      ...>   region: "nyc1",
      ...>   droplet_id: 11612190,
      ...>   tags: ["aninterestingname"]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  ## Example for detaching a volume from a droplet

      iex> DigitalOcean.VolumeAction.create(
      ...>   type: "detach",
      ...>   droplet_id: 11612190,
      ...>   volume_name: "example",
      ...>   region: "nyc1"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create_by_name(Keyword.t()) :: Operation.t()
  def create_by_name(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/actions")
  end

  @doc """
  Retrieve a volume action.

  ## Examples

      iex> DigitalOcean.VolumeAction.get("7724db7c-e098-11e5-b522-000f53304e51", 72531856) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t(), integer) :: Operation.t()
  def get(volume_id, action_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/volumes/#{volume_id}/actions/#{action_id}")
  end

  @doc """
  Retrieve a list of actions that have been executed on a volume.

  ## Examples

      iex> DigitalOcean.VolumeAction.list("7724db7c-e098-11e5-b522-000f53304e51") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(String.t(), Keyword.t()) :: Operation.t()
  def list(volume_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/volumes/#{volume_id}/actions")
  end
end
