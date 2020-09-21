defmodule DigitalOcean.DomainTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Domain, Operation }

  test "create/2" do
    name = "example.com"

    ip_address = "1.2.3.4"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [name: name, ip_address: ip_address])
    expected = Map.put(expected, :path, "/domains")

    assert expected == Domain.create(name: name, ip_address: ip_address)
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
    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/domains")

    assert expected == Domain.list(page: page)
  end
end
