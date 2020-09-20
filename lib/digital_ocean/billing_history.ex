defmodule DigitalOcean.BillingHistory do
  alias DigitalOcean.{ Operation }
  
  @doc """
  Retrieve a list of billing history for your account.

  ## Examples

      iex> DigitalOcean.BillingHistory.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list :: Operation.t()
  def list do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/customers/my/billing_history")
  end
end
