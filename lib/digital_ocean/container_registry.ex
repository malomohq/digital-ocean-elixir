defmodule DigitalOcean.ContainerRegistry do
  alias DigitalOcean.{ Operation }

  @doc """
  Delete your container registry.

  ## Examples

      iex> DigitalOcean.ContainerRegistry.delete() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete :: Operation.t()
  def delete do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/registry")
  end

  @doc """
  Delete a container registry repository by digest.

  ## Examples

      iex> DigitalOcean.ContainerRegistry.delete_repository_manifest_by_digest("example", "repo-1", "sha256:cb8a924afdf0229ef7515d9e5b3024e23b3eb03ddbba287f4a19c6ac90b8d221") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_repository_manifest_by_digest(String.t(), String.t(), String.t()) :: Operation.t()
  def delete_repository_manifest_by_digest(container_registry_name, repository_name, digest) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/registry/#{container_registry_name}/repositories/#{repository_name}/digests/#{digest}")
  end

  @doc """
  Delete a repository tag in your container registry.

  ## Examples

      iex> DigitalOcean.ContainerRegistry.delete_repository_tag("example", "repo-1", "mytag") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_repository_tag(String.t(), String.t(), String.t()) :: Operation.t()
  def delete_repository_tag(container_registry_name, repository_name, tag) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/registry/#{container_registry_name}/repositories/#{repository_name}/tags/#{tag}")
  end

  @doc """
  Retrieve information about your container registry.

  ## Examples

      iex> DigitalOcean.ContainerRegistry.get() |> DigitalOcean.request()
      { :ok, DigitalOcean.Response{} }
  """
  @spec get :: Operation.t()
  def get do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/registry")
  end

  @doc """
  Retrieve Docker credentials for your container registry.

  ## Examples

      iex> DigitalOcean.ContainerRegistry.get_docker_credentials() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_docker_credentials :: Operation.t()
  def get_docker_credentials do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/registry/docker-credentials")
  end

  @doc """
  Retrieve a list of repositories in your container registry.

  ## Examples

      iex> DigitalOcean.ContainerRegistry.list_repositories("example") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_repositories(String.t(), Keyword.t()) :: Operation.t()
  def list_repositories(container_registry_name, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/registry/#{container_registry_name}/repositories")
  end

  @doc """
  Retrieve a list of in a repository.

  ## Examples

      iex> DigitalOcean.ContainerRegistry.list_repository_tags("example", "repo-1") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_repository_tags(String.t(), String.t()) :: Operation.t()
  def list_repository_tags(container_registry_name, repository_name, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/registry/#{container_registry_name}/repositories/#{repository_name}/tags")
  end

  @doc """
  Update your container registry.

  ## Examples

      iex> DigitalOcean.ContainerRegistry.update(name: "example") |> DigitalOcean.request()
      { :ok, DigitalOcean.Response{} }
  """
  @spec update(Keyword.t()) :: Operation.t()
  def update(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/registry")
  end

  @doc """
  Validate a container registry name.

  ## Examples

      iex> DigitalOcean.ContainerRegistry.validate_name("example") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec validate_name(String.t()) :: Operation.t()
  def validate_name(container_registry_name) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, [name: container_registry_name])
    |> Map.put(:path, "/registry/validate-name")
  end
end
