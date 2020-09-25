defmodule DigitalOcean.Account do
  alias DigitalOcean.{Operation}

  @doc """
  Show information for the current user's account.

  ## Examples

      iex> DigitalOcean.Account.get() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get :: Operation.t()
  def get do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/account")
  end
end
