defmodule DigitalOcean.DomainRecord do
  alias DigitalOcean.{Operation}

  @doc """
  Create a domain record.

  ## Examples

      iex> DigitalOcean.DomainRecord.create(
      ...>   type: "A",
      ...>   name: "www",
      ...>   data: "162.10.66.0",
      ...>   ttl: 1800
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(String.t(), Keyword.t()) :: Operation.t()
  def create(domain_name, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/domains/#{domain_name}/records")
  end

  @doc """
  Delete a domain record.

  ## Examples

      iex> DigitalOcean.DomainRecord.delete("example.com", 3352896) |> DigitalOcean.request()
      { :ok, %DigitalOcean.request() }
  """
  @spec delete(String.t(), DigitalOcean.id_t()) :: Operation.t()
  def delete(domain_name, record_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/domains/#{domain_name}/records/#{record_id}")
  end

  @doc """
  Retrieve details about a specific domain record.

  ## Examples

      iex> DigitalOcean.DomainRecord.get("example.com", 3352896) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Operation{} }
  """
  @spec get(String.t(), DigitalOcean.id_t()) :: Operation.t()
  def get(domain_name, record_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/domains/#{domain_name}/records/#{record_id}")
  end

  @doc """
  Retrieve a list of domain records.

  ## Examples

      iex> DigitalOcean.DomainRecord.list("example.com") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(String.t(), Keyword.t()) :: Operation.t()
  def list(domain_name, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/domains/#{domain_name}/records")
  end

  @doc """
  Update a domain record.

  ## Examples

      iex> DigitalOcean.DomainRecord.update(
      ...>   "example.com",
      ...>   3352896,
      ...>   name: "blog"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update(String.t(), DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def update(domain_name, record_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/domains/#{domain_name}/records/#{record_id}")
  end
end
