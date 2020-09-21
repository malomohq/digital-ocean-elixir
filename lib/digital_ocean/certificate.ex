defmodule DigitalOcean.Certificate do
  alias DigitalOcean.{ Operation }

  @doc """
  Create a custom or Let's Encrypt certificate.

  ## Examples

      iex> DigitalOcean.Certificate.create(
      ...>   name: "le-cert-01",
      ...>   type: "lets_encrypt",
      ...>   dns_names: ["example.com"]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/certificates")
  end

  @doc """
  Delete a certificate.

  ## Examples

      iex> DigitalOcean.Certificate.delete("892071a0-bb95-49bc-8021-3afd67a210bf") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(certificate_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/certificates/#{certificate_id}")
  end

  @doc """
  Retrieve details about a specific certificate.

  ## Examples

      iex> DigitalOcean.Certificate.get("892071a0-bb95-49bc-8021-3afd67a210bf") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t()) :: Operation.t()
  def get(certificate_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/certificates/#{certificate_id}")
  end

  @doc """
  Retrieve a list of certificates.

  ## Examples

      iex> DigitalOcean.Certificate.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/certificates")
  end
end
