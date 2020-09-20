defmodule DigitalOcean.Action do
  alias DigitalOcean.{ Operation }

  @doc """
  Retrieve a details about a specific action.

  ## Examples

      DigitalOcean.Action.get(36804636) |> DigitalOcean.request()
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

      DigitalOcean.Action.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list :: Operation.t()
  def list do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/actions")
  end
end
