defmodule DigitalOcean.Balance do
  alias DigitalOcean.{Operation}

  @doc """
  Retrieve the balance for your account.

  ## Examples

      iex> DigitalOcean.Balance.get() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get :: Operation.t()
  def get do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/customers/my/balance")
  end
end
