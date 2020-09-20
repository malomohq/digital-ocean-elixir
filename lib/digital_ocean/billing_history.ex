defmodule DigitalOcean.BillingHistory do
  alias DigitalOcean.{ Operation }

  @doc """
  Retrieve a list of your billing history.

  ## Examples

      iex> DigitalOcean.BillingHistory.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/customers/my/billing_history")
  end
end
