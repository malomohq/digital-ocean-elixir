defmodule DigitalOcean.Action do
  alias DigitalOcean.{ Operation }

  @doc """
  Retrieve details about a specific action.

  ## Examples

      iex> DigitalOcean.Action.get(36804636) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(DigitalOcean.id_t()) :: Operation.t()
  def get(action_id) do
    %Operation{}
    |> Map.put(:method,  :get)
    |> Map.put(:path, "/actions/#{action_id}")
  end

  @doc """
  Retrieve a list of actions taken on an account.

  ## Examples

      iex> DigitalOcean.Action.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/actions")
  end
end
