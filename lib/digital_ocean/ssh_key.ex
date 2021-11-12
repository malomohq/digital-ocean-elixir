defmodule DigitalOcean.SSHKey do
  alias DigitalOcean.{Operation}

  @doc """
  Create an SSH key.

  ## Examples

      iex> DigitalOcean.SSHKey.create(
      ...>   name: "my ssh public key",
      ...>   public_key: "ssh-rsa AEXAMPLEaC1yc2EAAAADAQABAAAAQQDDHr/jh2Jy4yALcK4JyWbVkPRaWmhck3IgCoeOO3z1e2dBowLh64QAM+Qb72pxekALga2oi4GvT+TlWNhzPH4V example",
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/account/keys")
  end

  @doc """
  Delete an SSH key.

  ## Examples

      iex> DigitalOcean.SSHKey.delete(3164494) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(DigitalOcean.id_t()) :: Operation.t()
  def delete(key_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/account/keys/#{key_id}")
  end

  @doc """
  Retrieve an existing SSH key.

  ## Examples

      iex> DigitalOcean.SSHKey.get(512190) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response() }
  """
  @spec get(DigitalOcean.id_t()) :: Operation.t()
  def get(key_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/account/keys/#{key_id}")
  end

  @doc """
  Retrieve a list of SSH keys.

  ## Examples

      iex> DigitalOcean.SSHKey.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/account/keys")
  end

  @doc """
  Update the name of an SSH key.

  ## Examples

      iex> DigitalOcean.SSHKey.update(
      ...>   512190,
      ...>   name: "New Name For SSH Public Key"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def update(key_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/account/keys/#{key_id}")
  end
end
