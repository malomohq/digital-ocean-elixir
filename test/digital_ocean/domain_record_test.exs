defmodule DigitalOcean.DomainRecordTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ DomainRecord, Operation }

  test "create/2" do
    domain_name = "example.com"

    type = "A"

    name = "www"

    data = "162.10.66.0"

    ttl = 1800

    params = Keyword.new()
    params = Keyword.put(params, :type, type)
    params = Keyword.put(params, :name, name)
    params = Keyword.put(params, :data, data)
    params = Keyword.put(params, :ttl, ttl)

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, params)
    expected = Map.put(expected, :path, "/domains/#{domain_name}/records")

    assert expected == DomainRecord.create(domain_name, params)
  end

  test "delete/2" do
    domain_name = "example.com"

    record_id = 3352896

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/domains/#{domain_name}/records/#{record_id}")

    assert expected == DomainRecord.delete(domain_name, record_id)
  end

  test "get/2" do
    domain_name = "example.com"

    record_id = 3352896

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/domains/#{domain_name}/records/#{record_id}")

    assert expected == DomainRecord.get(domain_name, record_id)
  end

  test "list/2" do
    domain_name = "example.com"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/domains/#{domain_name}/records")

    assert expected == DomainRecord.list(domain_name, page: page)
  end

  test "update/3" do
    domain_name = "example.com"

    record_id = 3352896

    name = "blog"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [name: name])
    expected = Map.put(expected, :path, "/domains/#{domain_name}/records/#{record_id}")

    assert expected == DomainRecord.update(domain_name, record_id, name: name)
  end
end
