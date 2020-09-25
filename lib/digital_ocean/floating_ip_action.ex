defmodule DigitalOcean.FloatingIPAction do
  alias DigitalOcean.{Operation}

  @doc """
  Create an action for a floating IP.

  ## Example assigning a floating IP to a droplet

      iex> DigitalOcean.FloatingIPAction.create(
      ...>   "45.55.96.47",
      ...>   type: "assign",
      ...>   droplet_id: 8219222
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  ## Example unassigning a floating IP to a droplet

      iex> DigitalOcean.FloatingIPAction.create(
      ...>   "45.55.96.47",
      ...>   type: "unassign"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(String.t(), Keyword.t()) :: Operation.t()
  def create(ip_addr, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/floating_ips/#{ip_addr}/actions")
  end

  @doc """
  Retrieve an action for a floating ip.

  ## Example

      iex> DigitalOcean.FloatingIPAction.get("45.55.96.47", 72531856) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t(), DigitalOcean.id_t()) :: Operation.t()
  def get(ip_addr, action_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/floating_ips/#{ip_addr}/actions/#{action_id}")
  end

  @doc """
  Retrieve a list of floating IP actions.

  ## Examples

      iex> DigitalOcean.FloatingIPAction.list("45.55.96.47") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  def list(ip_addr, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/floating_ips/#{ip_addr}/actions")
  end
end
