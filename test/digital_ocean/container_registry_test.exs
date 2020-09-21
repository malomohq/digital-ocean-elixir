defmodule DigitalOcean.ContainerRegistryTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ ContainerRegistry, Operation }

  test "delete/0" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/registry")

    assert expected == ContainerRegistry.delete()
  end

  test "delete_repository_manifest_by_digest/3" do
    container_registry_name = "example"

    repository_name = "repo-1"

    digest = "sha256:cb8a924afdf0229ef7515d9e5b3024e23b3eb03ddbba287f4a19c6ac90b8d221"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/registry/#{container_registry_name}/repositories/#{repository_name}/digests/#{digest}")

    assert expected == ContainerRegistry.delete_repository_manifest_by_digest(container_registry_name, repository_name, digest)
  end

  test "delete_repository_tag/3" do
    container_registry_name = "example"

    repository_name = "repo-1"

    tag = "mytag"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/registry/#{container_registry_name}/repositories/#{repository_name}/tags/#{tag}")

    assert expected == ContainerRegistry.delete_repository_tag(container_registry_name, repository_name, tag)
  end

  test "get/0" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/registry")

    assert expected == ContainerRegistry.get()
  end

  test "get_docker_credentials/0" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/registry/docker-credentials")

    assert expected == ContainerRegistry.get_docker_credentials()
  end

  test "list_repositories/1" do
    name = "example"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/registry/#{name}/repositories")

    assert expected == ContainerRegistry.list_repositories(name, page: page)
  end

  test "list_repository_tags/3" do
    container_registry_name = "exmple"

    repository_name = "repo-1"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/registry/#{container_registry_name}/repositories/#{repository_name}/tags")

    assert expected == ContainerRegistry.list_repository_tags(container_registry_name, repository_name, page: page)
  end

  test "update/1" do
    name = "example"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [name: name])
    expected = Map.put(expected, :path, "/registry")

    assert expected == ContainerRegistry.update(name: name)
  end

  test "validate_name/1" do
    name = "example"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [name: name])
    expected = Map.put(expected, :path, "/registry/validate-name")

    assert expected == ContainerRegistry.validate_name(name)
  end
end
