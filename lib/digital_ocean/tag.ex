defmodule DigitalOcean.Tag do
  alias DigitalOcean.{ Operation }

  @doc """
  Create a tag.

  ## Examples

      iex> DigitalOcean.Tag.create(
      ...>   name: "mytag",
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/tags")
  end

  @doc """
  Delete a tag.

  ## Examples

      iex> DigitalOcean.Tag.delete("mytag") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(tag_name) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/tags/#{tag_name}")
  end

  @doc """
  Retrieve details about a specific tag.

  ## Examples

      iex> DigitalOcean.Tag.get("mytag") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t()) :: Operation.t()
  def get(tag_name) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/tags/#{tag_name}")
  end

  @doc """
  Retrieve a list of tags.

  ## Examples

      iex> DigitalOcean.Tag.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/tags")
  end

  @doc """
  Tag the given resources with specific tag.

  ## Examples
  
  iex> DigitalOcean.Tag.tag_resources("mytag", resources: [resource_id: "123", resource_name: "mydroplet"]) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec tag_resources(String.t(), Keyword.t()) :: Operation.t()
  def tag_resources(tag_name, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/tags/#{tag_name}/resources")
  end

  @doc """
  Untag the given resources with specific tag.

  ## Examples
  
  iex> DigitalOcean.Tag.untag_resources("mytag", resources: [resource_id: "123", resource_name: "mydroplet"]) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec untag_resources(String.t(), Keyword.t()) :: Operation.t()
  def untag_resources(tag_name, opts) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/tags/#{tag_name}/resources")
  end
end
