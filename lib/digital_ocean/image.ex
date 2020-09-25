defmodule DigitalOcean.Image do
  alias DigitalOcean.{Operation}

  @doc """
  Create a custom image.

  ## Examples

      iex> DigitalOcean.Image.create(
      ...>   name: "ubuntu-18.04-minimal",
      ...>   url: "http://cloud-images.ubuntu.com/minimal/releases/bionic/release/ubuntu-18.04-minimal-cloudimg-amd64.img",
      ...>   distribution: "ubuntu",
      ...>   region: "nyc3",
      ...>   description: "Cloud-optimized image w/ small footprint",
      ...>   tags: ["base-image", "prod"]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/images")
  end

  @doc """
  Delete an image.

  ## Examples

      iex> DigitalOcean.Image.delete(7938391) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(DigitalOcean.id_t()) :: Operation.t()
  def delete(image_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/images/#{image_id}")
  end

  @doc """
  Retrieve an image by id or slug.

  ## Example retrieving an image by id

      iex> DigitalOcean.Image.get(7555620) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  ## Example retrieving an image by slug

      iex> DigitalOcean.Image.get("ubuntu-16-04-x64") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t() | integer) :: Operation.t()
  def get(id_or_slug) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/images/#{id_or_slug}")
  end

  @doc """
  Retrieve a list of images.

  ## Example retrieving all images

      iex> DigitalOcean.Image.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  ## Example retrieving distribution images

      iex> DigitalOcean.Image.list(type: "distribution") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  See the official DigitalOcean v2 API documentation for all options listing
  images.
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/images")
  end

  @doc """
  Update an image.

  ## Examples

      iex> DigitalOcean.Image.update("7938391", name: "new-image-name") |> DigitalOcean.request()
      { :ok, DigitalOcean.Response{} }
  """
  @spec update(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def update(image_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/images/#{image_id}")
  end
end
