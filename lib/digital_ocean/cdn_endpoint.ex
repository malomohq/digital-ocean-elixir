defmodule DigitalOcean.CDNEndpoint do
  alias DigitalOcean.{Operation}

  @doc """
  Create a CDN endpoint.

  ## Examples

      iex> DigitalOcean.CDNEndpoint.create(
      ...>   origin: "static-images.nyc3.digitaloceanspaces.com",
      ...>   certificate_id: "892071a0-bb95-49bc-8021-3afd67a210bf",
      ...>   custom_domain: "static.example.com",
      ...>   ttl: 3600
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/cdn/endpoints")
  end

  @doc """
  Delete a CDN endpoint.

  ## Examples

      iex> DigitalOcean.CDNEndpoint.delete("19f06b6a-3ace-4315-b086-499a0e521b76") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(endpoint_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/cdn/endpoints/#{endpoint_id}")
  end

  @doc """
  Retrieve details about a specific CDN endpoint.

  ## Examples

      iex> DigitalOcean.CDNEndpoint.get("19f06b6a-3ace-4315-b086-499a0e521b76") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t()) :: Operation.t()
  def get(endpoint_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/cdn/endpoints/#{endpoint_id}")
  end

  @doc """
  Retrieve a list of CDN endpoints.

  ## Exampless

      iex> DigitalOcean.CDNEndpoint.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/cdn/endpoints")
  end

  @doc """
  Purge cached content from an CDN endpoint.

  ## Examples

      iex> DigitalOcean.CDNEndpoint.purge_cache(
      ...>   "19f06b6a-3ace-4315-b086-499a0e521b76",
      ...>   files: ["*"]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  def purge_cache(endpoint_id, opts) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/cdn/endpoints/#{endpoint_id}/cache")
  end

  @doc """
  Update a CDN endpoint.

  ## Examples

      iex> DigitalOcean.CDNEndpoint.update(
      ...>   "19f06b6a-3ace-4315-b086-499a0e521b76",
      ...>   ttl: 1800
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update(String.t(), Keyword.t()) :: Operation.t()
  def update(endpoint_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/cdn/endpoints/#{endpoint_id}")
  end
end
