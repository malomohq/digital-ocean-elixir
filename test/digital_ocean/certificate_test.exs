defmodule DigitalOcean.CertificateTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Certificate, Operation }

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/certificates")

    assert expected == Certificate.create(p1: "v")
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
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/certificates")

    assert expected == Certificate.list(p1: "v")
  end
end
