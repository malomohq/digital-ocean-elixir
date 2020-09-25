defmodule DigitalOcean.DomainRecordTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{DomainRecord, Operation}

  test "create/2" do
    domain_name = "example.com"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/domains/#{domain_name}/records")

    assert expected == DomainRecord.create(domain_name, p1: "v")
  end

  test "delete/2" do
    domain_name = "example.com"

    record_id = 3_352_896

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/domains/#{domain_name}/records/#{record_id}")

    assert expected == DomainRecord.delete(domain_name, record_id)
  end

  test "get/2" do
    domain_name = "example.com"

    record_id = 3_352_896

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/domains/#{domain_name}/records/#{record_id}")

    assert expected == DomainRecord.get(domain_name, record_id)
  end

  test "list/2" do
    domain_name = "example.com"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/domains/#{domain_name}/records")

    assert expected == DomainRecord.list(domain_name, p1: "v")
  end

  test "update/3" do
    domain_name = "example.com"

    record_id = 3_352_896

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/domains/#{domain_name}/records/#{record_id}")

    assert expected == DomainRecord.update(domain_name, record_id, p1: "v")
  end
end
