defmodule DigitalOcean.ImageAction do
  alias DigitalOcean.{ Operation }

  @doc """
  Create an action for an image.

  ## Example transferring an image to another region

      iex> DigitalOcean.ImageAction.create(
      ...>   7938269,
      ...>   type: "transfer",
      ...>   region: "nyc2"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  ## Example converting an image from a backup to a snapshot

      iex> DigitalOcean.ImageAction.create(
      ...>   7938291,
      ...>   type: "convert"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(integer, Keyword.t()) :: Operation.t()
  def create(image_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/images/#{image_id}/actions")
  end

  @doc """
  Retrieve an action for an image.

  ## Examples

      iex> DigitalOcean.ImageAction.get(7938269, 36805527) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(integer, integer) :: Operation.t()
  def get(image_id, action_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/images/#{image_id}/actions/#{action_id}")
  end

  @doc """
  Retrieve a list of image actions.

  ## Examples

      iex> DigitalOcean.ImageAction.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(integer) :: Operation.t()
  def list(image_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/images/#{image_id}/actions")
  end
end
