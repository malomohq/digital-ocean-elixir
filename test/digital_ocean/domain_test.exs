defmodule DigitalOcean.DomainTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{Domain, Operation}

  test "create/2" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/domains")

    assert expected == Domain.create(p1: "v")
  end

  test "delete/1" do
    name = "example.com"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/domains/#{name}")

    assert expected == Domain.delete(name)
  end

  test "get/1" do
    name = "example.com"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/domains/#{name}")

    assert expected == Domain.get(name)
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/domains")

    assert expected == Domain.list(p1: "v")
  end
end
