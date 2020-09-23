defmodule DigitalOcean.DropletAction do
  alias DigitalOcean.{ Operation }

  @doc """
  Create an action for a droplet.

  ## Example enabling backups for a droplet

      iex> DigitalOcean.DropletAction.create(
      ...>   3164450,
      ...>   type: "enable_backups"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  See the official DigitalOcean v2 API documentation for all options regarding
  creating a droplet action.
  """
  @spec create(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def create(droplet_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/droplets/#{droplet_id}/actions")
  end

  @doc """
  Create an action for droplets by tag.

  ## Examples

      iex> DigitalOcean.DropletAction.create_by_tag_name("awesome") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create_by_tag_name(String.t()) :: Operation.t()
  def create_by_tag_name(tag_name) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:path, "/droplets/actions?tag_name=#{tag_name}")
  end

  @doc """
  Retrieve an action for a droplet.

  ## Examples

      iex> DigitalOcean.DropletAction.get(3164444, 36804807) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(DigitalOcean.id_t(), DigitalOcean.id_t()) :: Operation.t()
  def get(droplet_id, action_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/droplets/#{droplet_id}/actions/#{action_id}")
  end
end
