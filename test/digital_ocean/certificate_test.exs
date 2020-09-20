defmodule DigitalOcean.CertificateTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Certificate, Operation }

  test "create/3" do
    name = "le-cert-01"

    type = "lets_encrypt"

    dns_names = ["example.com"]

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [type: type, name: name, dns_names: dns_names])
    expected = Map.put(expected, :path, "/certificates")

    assert expected == Certificate.create(name, type, dns_names: dns_names)
  end

  test "delete/1" do
    certificate_id = "892071a0-bb95-49bc-8021-3afd67a210bf"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/certificates/#{certificate_id}")

    assert expected == Certificate.delete(certificate_id)
  end

  test "get/1" do
    certificate_id = "892071a0-bb95-49bc-8021-3afd67a210bf"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/certificates/#{certificate_id}")

    assert expected == Certificate.get(certificate_id)
  end

  test "list/2" do
    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/certificates")

    assert expected == Certificate.list(page: page)
  end
end
