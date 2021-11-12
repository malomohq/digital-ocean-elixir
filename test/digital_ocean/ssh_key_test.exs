defmodule DigitalOcean.SSHKeyTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Operation, SSHKey }

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/account/keys")

    assert expected == SSHKey.create(p1: "v")
  end

  test "delete/1" do
    key_id = 512190

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/account/keys/#{key_id}")

    assert expected == SSHKey.delete(key_id)
  end

  test "get/1" do
    key_id = 512190

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/account/keys/#{key_id}")

    assert expected == SSHKey.get(key_id)
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/account/keys")

    assert expected == SSHKey.list(p1: "v")
  end

  test "update/2" do
    key_id = 512190

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/account/keys/#{key_id}")

    assert expected == SSHKey.update(key_id, p1: "v")
  end
end
