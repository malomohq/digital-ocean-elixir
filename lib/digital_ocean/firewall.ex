defmodule DigitalOcean.Firewall do
  alias DigitalOcean.{ Operation }

  @doc """
  Add droplets to a firewall.

  ## Examples

      iex> DigitalOcean.Firewall.add_droplets(
      ...>   "bb4b2611-3d72-467b-8602-280330ecd65c",
      ...>   droplet_ids: [49696269]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec add_droplets(String.t(), Keyword.t()) :: Operation.t()
  def add_droplets(firewall_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/firewalls/#{firewall_id}/droplets")
  end

  @doc """
  Add rules to a firewall.

  ## Examples

      iex> DigitalOcean.Firewall.add_rules(
      ...>   "bb4b2611-3d72-467b-8602-280330ecd65c",
      ...>   inbound_rules: [
      ...>     %{
      ...>        protocol: "tcp",
      ...>        ports: "3306",
      ...>        sources: {
      ...>          droplet_ids: [49696269]
      ...>        }
      ...>     }
      ...>   ],
      ...>   outbound_rules: [
      ...>     %{
      ...>        protocol: "tcp",
      ...>        ports: "3306",
      ...>        sources: {
      ...>          droplet_ids: [49696269]
      ...>        }
      ...>     }
      ...>   ]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec add_rules(String.t(), Keyword.t()) :: Operation.t()
  def add_rules(firewall_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/firewalls/#{firewall_id}/rules")
  end

  @doc """
  Add tags to a firewall.

  ## Examples

      iex> DigitalOcean.Firewall.add_tags(
      ...>   "bb4b2611-3d72-467b-8602-280330ecd65c",
      ...>   tags: ["frontend"]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec add_tags(String.t(), Keyword.t()) :: Operation.t()
  def add_tags(firewall_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/firewalls/#{firewall_id}/tags")
  end

  @doc """
  Create a firewall.

  ## Examples

      iex> DigitalOcean.Firewall.create(
      ...>   name: "firewall",
      ...>   inbound_rules: [
      ...>     %{
      ...>        protocol: "tcp",
      ...>        ports: "80",
      ...>        sources: {
      ...>          load_balancer_uids: ["4de7ac8b-495b-4884-9a69-1050c6793cd6"]
      ...>        }
      ...>      }
      ...>   ],
      ...>   outbound_rules: [
      ...>     %{
      ...>        protocol: "tcp",
      ...>        ports: "80",
      ...>        destinations: %{
      ...>          addresses: [
      ...>            "0.0.0.0/0",
      ...>            "::/0"
      ...>          ]
      ...>        }
      ...>      }
      ...>   ],
      ...>   droplet_ids: [8043964]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/firewalls")
  end

  @doc """
  Delete a firewall.

  ## Examples

      iex> DigitalOcean.Firewall.delete("bb4b2611-3d72-467b-8602-280330ecd65c") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(firewall_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/firewalls/#{firewall_id}")
  end

  @doc """
  Retrieve a firewall.

  ## Examples

      iex> DigitalOcean.Firewall.get("bb4b2611-3d72-467b-8602-280330ecd65c") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t()) :: Operation.t()
  def get(firewall_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/firewalls/#{firewall_id}")
  end

  @doc """
  Retrieve a list of firewalls.

  ## Examples

      iex> DigitalOcean.Firewall.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/firewalls")
  end

  @doc """
  Remove droplets from a firewall.

  ## Examples

      iex> DigitalOcean.Fireall.remove_droplets(
      ...>   "bb4b2611-3d72-467b-8602-280330ecd65c",
      ...>   droplet_ids: [49696269]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec remove_droplets(String.t(), Keyword.t()) :: Operation.t()
  def remove_droplets(firewall_id, opts) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/firewalls/#{firewall_id}/droplets")
  end

  @doc """
  Remove rules from a firewall.

  ## Examples

      iex> DigitalOcean.Firewall.remove_rules(
      ...>   "bb4b2611-3d72-467b-8602-280330ecd65c",
      ...>   inbound_rules: [
      ...>     %{
      ...>        protocol: "tcp",
      ...>        ports: "3306",
      ...>        sources: {
      ...>          droplet_ids: [49696269]
      ...>        }
      ...>     }
      ...>   ],
      ...>   outbound_rules: [
      ...>     %{
      ...>        protocol: "tcp",
      ...>        ports: "3306",
      ...>        sources: {
      ...>          droplet_ids: [49696269]
      ...>        }
      ...>     }
      ...>   ]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  def remove_rules(firewall_id, opts) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/firewalls/#{firewall_id}/rules")
  end

  @doc """
  Remove tags from a firewall.

  ## Examples

      iex> DigitalOcean.Fireall.remove_tags(
      ...>   "bb4b2611-3d72-467b-8602-280330ecd65c",
      ...>   tags: ["frontend"]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec remove_tags(String.t(), Keyword.t()) :: Operation.t()
  def remove_tags(firewall_id, opts) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params,  opts)
    |> Map.put(:path, "/firewalls/#{firewall_id}/tags")
  end

  @doc """
  Update a firewall.

  ## Examples

      iex> DigitalOcean.Firewall.update(
      ...>  "bb4b2611-3d72-467b-8602-280330ecd65c",
      ...>   name: "firewall",
      ...>   inbound_rules: [
      ...>     %{
      ...>        protocol: "tcp",
      ...>        ports: "80",
      ...>        sources: {
      ...>          load_balancer_uids: ["4de7ac8b-495b-4884-9a69-1050c6793cd6"]
      ...>        }
      ...>      }
      ...>   ],
      ...>   outbound_rules: [
      ...>     %{
      ...>        protocol: "tcp",
      ...>        ports: "80",
      ...>        destinations: %{
      ...>          addresses: [
      ...>            "0.0.0.0/0",
      ...>            "::/0"
      ...>          ]
      ...>        }
      ...>      }
      ...>   ],
      ...>   droplet_ids: [8043964]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update(String.t(), Keyword.t()) :: Operation.t()
  def update(firewall_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/firewalls/#{firewall_id}")
  end
end
