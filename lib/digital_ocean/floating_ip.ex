defmodule DigitalOcean.FloatingIP do
  alias DigitalOcean.{Operation}

  @doc """
  Create a floating IP.

  ## Example creating a floating IP for a droplet

      iex> DigitalOcean.FloatingIP.create(droplet_id: 123456) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  ## Example create a floating IP reserved for a region

      iex> DigitalOcean.FloatingIP.create(region: "nyc3") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/floating_ips")
  end

  @doc """
  Delete a floating IP.

  ## Examples

      iex> DigitalOcean.FloatingIP.delete("45.55.96.47") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(ip_addr) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/floating_ips/#{ip_addr}")
  end

  @doc """
  Retrieve a floating IP.

  ## Examples

      iex> DigitalOcean.FloatingIP.get("45.55.96.47") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t()) :: Operation.t()
  def get(ip_addr) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/floating_ips/#{ip_addr}")
  end

  @doc """
  Retrieve a list of floating IP's.

  ## Examples

      iex> DigitalOcean.FloatingIP.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/floating_ips")
  end
end
