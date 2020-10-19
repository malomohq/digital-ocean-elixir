defmodule DigitalOcean.LoadBalancer do
  alias DigitalOcean.{ Operation }

  @doc """
  Add droplets to a load balancer.

  ## Examples

      iex> DigitalOcean.LoadBalancer.add_droplets(
      ...>   "4de7ac8b-495b-4884-9a69-1050c6793cd6",
      ...>   droplet_ids: [
      ...>     3164446,
      ...>     3164447
      ...>   ]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Operation{} }
  """
  @spec add_droplets(String.t(), Keyword.t()) :: Operation.t()
  def add_droplets(load_balancer_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/load_balancers/#{load_balancer_id}/droplets")
  end

  @doc """
  Add forwarding rules to a load balancer.

  ## Examples

      iex> DigitalOcean.LoadBalancer.add_forwarding_rules(
      ...>   "4de7ac8b-495b-4884-9a69-1050c6793cd6",
      ...>   forwarding_rules: [
      ...>     %{
      ...>       entry_protocol: "tcp",
      ...>       entry_port: 3306,
      ...>       target_protocol: "tcp",
      ...>       target_port: 3306
      ...>     }
      ...>   ]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Operation{} }
  """
  @spec add_forwarding_rules(String.t(), Keyword.t()) :: Operation.t()
  def add_forwarding_rules(load_balancer_id, opts) do
    %Operation{}
    |> Map.put(:method,  :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/load_balancers/#{load_balancer_id}/forwarding_rules")
  end

  @doc """
  Create a load balancer.

  ## Examples

      iex> DigitalOcean.LoadBalancer.create(
      ...>   name: "example-lb-01",
      ...>   region: "nyc3",
      ...>   forwarding_rules: [
      ...>     %{
      ...>       entry_protocol: "http",
      ...>       entry_port: 80,
      ...>       target_port: 80,
      ...>       certificate_id: "",
      ...>       tls_passthrough: false
      ...>     }
      ...>   ],
      ...>   health_check: %{
      ...>     protocol: "http",
      ...>     port: 80,
      ...>     path: "/",
      ...>     check_interval_seconds: 10,
      ...>     response_timeout_seconds: 5,
      ...>     healthy_threshold: 5,
      ...>     unhealthy_threshold: 3
      ...>   },
      ...>   sticky_sessions: %{
      ...>     type: "none"
      ...>   },
      ...>   droplet_ids: [
      ...>     3164444,
      ...>     3164445
      ...>   ]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/load_balancers")
  end

  @doc """
  Delete a load balancer.

  ## Examples

      iex> DigitalOcean.LoadBalancer.delete("4de7ac8b-495b-4884-9a69-1050c6793cd6") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(load_balancer_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/load_balancers/#{load_balancer_id}")
  end

  @doc """
  Retrieve a load balancer.

  ## Examples

      iex> DigitalOcean.LoadBalancer.get("4de7ac8b-495b-4884-9a69-1050c6793cd6") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t()) :: Operation.t()
  def get(load_balancer_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/load_balancers/#{load_balancer_id}")
  end

  @doc """
  Retrieve a list of load balancers.

  ## Examples

      iex> DigitalOcean.LoadBalancer.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/load_balancers")
  end

  @doc """
  Remove droplets from a load balancer.

  ## Examples

      iex> DigitalOcean.LoadBalancer.remove_droplets(
      ...>   "4de7ac8b-495b-4884-9a69-1050c6793cd6",
      ...>   droplet_ids: [
      ...>     3164446,
      ...>     3164447
      ...>   ]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec remove_droplets(String.t(), Keyword.t()) :: Operation.t()
  def remove_droplets(load_balancer_id, opts) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/load_balancers/#{load_balancer_id}/droplets")
  end

  @doc """
  Remove forwarding rules from a load b balancer.

  ## Examples

      iex> DigitalOcean.LoadBalancer.remove_forwarding_rules(
      ...>   "4de7ac8b-495b-4884-9a69-1050c6793cd6",
      ...>   forwarding_rules: [
      ...>     %{
      ...>       entry_protocol: "tcp",
      ...>       entry_port: 3306,
      ...>       target_protocol: "tcp",
      ...>       target_port: 3306
      ...>     }
      ...>   ]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response() }
  """
  @spec remove_forwarding_rules(String.t(), Keyword.t()) :: Operation.t()
  def remove_forwarding_rules(load_balancer_id, opts) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/load_balancers/#{load_balancer_id}/forwarding_rules")
  end

  @doc """
  Update a load balancer.

  ## Examples

      iex> DigitalOcean.LoadBalancer.update(
      ...>   "4de7ac8b-495b-4884-9a69-1050c6793cd6"
      ...>   name: "example-lb-01",
      ...>   region: "nyc3",
      ...>   algorithm: "least_connections",
      ...>   forwarding_rules: [
      ...>     %{
      ...>       entry_protocol: "http",
      ...>       entry_port: 80,
      ...>       target_protocol: "http",
      ...>       target_port: 80
      ...>     }
      ...>   ],
      ...>   health_check: %{
      ...>     protocol: "http",
      ...>     port: 80,
      ...>     path: "/",
      ...>     check_interval_seconds: 10,
      ...>     response_timeout_seconds: 5,
      ...>     healthy_threshold: 5,
      ...>     unhealthy_threshold: 3
      ...>   },
      ...>   sticky_sessions: %{
      ...>     type: "cookies",
      ...>     cookie_name: "DO_LB",
      ...>     cookie_ttl_seconds: 300
      ...>   },
      ...>   droplet_ids: [
      ...>     3164444,
      ...>     3164445
      ...>   ]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update(String.t(), Keyword.t()) :: Operation.t()
  def update(load_balancer_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/load_balancers/#{load_balancer_id}")
  end
end
