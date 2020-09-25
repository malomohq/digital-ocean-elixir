defmodule DigitalOcean.DatabaseTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{Database, Operation}

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases")

    assert expected == Database.create(p1: "v")
  end

  test "create_connection_pool/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/pools")

    assert expected == Database.create_connection_pool(database_id, p1: "v")
  end

  test "create_db/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/dbs")

    assert expected == Database.create_db(database_id, p1: "v")
  end

  test "create_replica/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/replicas")

    assert expected == Database.create_replica(database_id, p1: "v")
  end

  test "create_user/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/users")

    assert expected == Database.create_user(database_id, p1: "v")
  end

  test "delete/1" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/databases/#{database_id}")

    assert expected == Database.delete(database_id)
  end

  test "delete_connection_pool/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    connection_pool_name = "backend-pool"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/databases/#{database_id}/pools/#{connection_pool_name}")

    assert expected == Database.delete_connection_pool(database_id, connection_pool_name)
  end

  test "delete_db/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    db_name = "alpha"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/databases/#{database_id}/dbs/#{db_name}")

    assert expected == Database.delete_db(database_id, db_name)
  end

  test "delete_replica/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    replica_name = "read-nyc3-01"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/databases/#{database_id}/replicas/#{replica_name}")

    assert expected == Database.delete_replica(database_id, replica_name)
  end

  test "delete_user/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    username = "app-01"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/databases/#{database_id}/users/#{username}")

    assert expected == Database.delete_user(database_id, username)
  end

  test "get/1" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/databases/#{database_id}")

    assert expected == Database.get(database_id)
  end

  test "get_connection_pool/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    connection_pool_name = "backend-pool"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/databases/#{database_id}/pools/#{connection_pool_name}")

    assert expected == Database.get_connection_pool(database_id, connection_pool_name)
  end

  test "get_db/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    db_name = "alpha"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/databases/#{database_id}/dbs/#{db_name}")

    assert expected == Database.get_db(database_id, db_name)
  end

  test "get_eviction_policy/1" do
    database_id = "9cdb64e5-61e4-4b30-b711-11ef66d84558"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/databases/#{database_id}/eviction_policy")

    assert expected == Database.get_eviction_policy(database_id)
  end

  test "get_replica/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    replica_name = "read-nyc3-01"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/databases/#{database_id}/replicas/#{replica_name}")

    assert expected == Database.get_replica(database_id, replica_name)
  end

  test "get_sql_mode/1" do
    database_id = "9cdb64e5-61e4-4b30-b711-11ef66d84558"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/databases/#{database_id}/sql_mode")

    assert expected == DigitalOcean.Database.get_sql_mode(database_id)
  end

  test "get_user/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    username = "app-01"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/databases/#{database_id}/users/#{username}")

    assert expected == Database.get_user(database_id, username)
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases")

    assert expected == Database.list(p1: "v")
  end

  test "list_backups/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/backups")

    assert expected == Database.list_backups(database_id, p1: "v")
  end

  test "list_connection_pools/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/pools")

    assert expected == Database.list_connection_pools(database_id, p1: "v")
  end

  test "list_dbs/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/dbs")

    assert expected == Database.list_dbs(database_id, p1: "v")
  end

  test "list_firewall_rules/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/firewall")

    assert expected == Database.list_firewall_rules(database_id, p1: "v")
  end

  test "list_replicas/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/replicas")

    assert expected == Database.list_replicas(database_id, p1: "v")
  end

  test "list_users/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/users")

    assert expected == DigitalOcean.Database.list_users(database_id, p1: "v")
  end

  test "migrate_to_region/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/migrate")

    assert expected == Database.migrate_to_region(database_id, p1: "v")
  end

  test "reset_user_authentication_method/3" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    username = "app-01"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/users/#{username}/reset_auth")

    assert expected ==
             DigitalOcean.Database.reset_user_authentication_method(database_id, username, p1: "v")
  end

  test "resize/3" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/resize")

    assert expected == Database.resize(database_id, p1: "v")
  end

  test "update_eviction_policy/2" do
    database_id = "9cdb64e5-61e4-4b30-b711-11ef66d84558"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/eviction_policy")

    assert expected == Database.update_eviction_policy(database_id, p1: "v")
  end

  test "update_firewall_rules/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/firewall")

    assert expected == Database.update_firewall_rules(database_id, p1: "v")
  end

  test "update_maintenance_window/3" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/maintenance")

    assert expected == Database.update_maintenance_window(database_id, p1: "v")
  end

  test "update_sql_mode/2" do
    database_id = "9cdb64e5-61e4-4b30-b711-11ef66d84558"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, p1: "v")
    expected = Map.put(expected, :path, "/databases/#{database_id}/sql_mode")

    assert expected == Database.update_sql_mode(database_id, p1: "v")
  end
end
