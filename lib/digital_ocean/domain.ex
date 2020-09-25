defmodule DigitalOcean.Domain do
  alias DigitalOcean.{Operation}

  @doc """
  Create a domain.

  ## Examples

      iex> DigitalOcean.Domain.create(
      ...>   name: "example.com",
      ...>   ip_address: "1.2.3.4"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/domains")
  end

  @doc """
  Delete a domain.

  ## Examples

      iex> DigitalOcean.Domain.delete("example.com") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(domain_name) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/domains/#{domain_name}")
  end

  @doc """
  Retrieve details about a specific domain.

  ## Examples

      iex> DigitalOcean.Domain.get("example.com") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t()) :: Operation.t()
  def get(domain_name) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/domains/#{domain_name}")
  end

  @doc """
  Retrieve a list of domains.

  ## Examples

      iex> DigitalOcean.Domain.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/domains")
  end
end
