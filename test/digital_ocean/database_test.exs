defmodule DigitalOcean.DatabaseTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Database, Operation }

  test "create/1" do
    name = "backend"

    region = "nyc3"

    engine = "pg"

    size = "db-s-2vcpu-4gb"

    number_of_nodes = 2

    params = Keyword.new()
    params = Keyword.put(params, :name, name)
    params = Keyword.put(params, :region, region)
    params = Keyword.put(params, :engine, engine)
    params = Keyword.put(params, :size, size)
    params = Keyword.put(params, :num_nodes, number_of_nodes)

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [num_nodes: number_of_nodes, size: size, engine: engine, region: region, name: name])
    expected = Map.put(expected, :path, "/databases")

    assert expected == Database.create(params)
  end

  test "create_connection_pool/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    name = "backend-pool"

    mode = "transaction"

    size = 10

    db = "defaultdb"

    user = "doadmin"

    params = Keyword.new()
    params = Keyword.put(params, :name, name)
    params = Keyword.put(params, :mode, mode)
    params = Keyword.put(params, :size, size)
    params = Keyword.put(params, :db, db)
    params = Keyword.put(params, :user, user)

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, params)
    expected = Map.put(expected, :path, "/databases/#{database_id}/pools")

    assert expected == Database.create_connection_pool(database_id, params)
  end

  test "create_db/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    name = "alpha"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [name: name])
    expected = Map.put(expected, :path, "/databases/#{database_id}/dbs")

    assert expected == Database.create_db(database_id, name: name)
  end

  test "create_replica/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    name = "read-nyc3-01"

    size = "db-s-2vcpu-4gb"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [name: name, size: size])
    expected = Map.put(expected, :path, "/databases/#{database_id}/replicas")

    assert expected == Database.create_replica(database_id, name: name, size: size)
  end

  test "create_user/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    name = "app-01"

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [name: name])
    expected = Map.put(expected, :path, "/databases/#{database_id}/users")

    assert expected == Database.create_user(database_id, name: name)
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
    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/databases")

    assert expected == Database.list(page: page)
  end

  test "list_backups/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/databases/#{database_id}/backups")

    assert expected == Database.list_backups(database_id, page: page)
  end

  test "list_connection_pools/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/databases/#{database_id}/pools")

    assert expected == Database.list_connection_pools(database_id, page: page)
  end

  test "list_dbs/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/databases/#{database_id}/dbs")

    assert expected == Database.list_dbs(database_id, page: page)
  end

  test "list_firewall_rules/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/databases/#{database_id}/firewall")

    assert expected == Database.list_firewall_rules(database_id, page: page)
  end

  test "list_replicas/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/databases/#{database_id}/replicas")

    assert expected == Database.list_replicas(database_id, page: page)
  end

  test "list_users/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/databases/#{database_id}/users")

    assert expected == DigitalOcean.Database.list_users(database_id, page: page)
  end

  test "migrate_to_region/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    region = "lon1"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [region: region])
    expected = Map.put(expected, :path, "/databases/#{database_id}/migrate")

    assert expected == Database.migrate_to_region(database_id, region: region)
  end

  test "reset_user_authentication_method/3" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    username = "app-01"

    mysql_settings = %{ auth_plugin: "caching_sha2_password" }

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [mysql_settings: mysql_settings])
    expected = Map.put(expected, :path, "/databases/#{database_id}/users/#{username}/reset_auth")

    assert expected == DigitalOcean.Database.reset_user_authentication_method(database_id, username, mysql_settings: mysql_settings)
  end

  test "resize/3" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    size = "db-s-4vcpu-8gb"

    number_of_nodes = 3

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [size: size, num_nodes: number_of_nodes])
    expected = Map.put(expected, :path, "/databases/#{database_id}/resize")

    assert expected == Database.resize(database_id, size: size, num_nodes: number_of_nodes)
  end

  test "update_eviction_policy/2" do
    database_id = "9cdb64e5-61e4-4b30-b711-11ef66d84558"

    eviction_policy = "allkeys_lru"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [eviction_policy: eviction_policy])
    expected = Map.put(expected, :path, "/databases/#{database_id}/eviction_policy")

    assert expected == Database.update_eviction_policy(database_id, eviction_policy: eviction_policy)
  end

  test "update_firewall_rules/2" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    rules = [%{ type: "ip_addr", value: "192.168.1.1" }]

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [rules: rules])
    expected = Map.put(expected, :path, "/databases/#{database_id}/firewall")

    assert expected == Database.update_firewall_rules(database_id, rules: rules)
  end

  test "update_maintenance_window/3" do
    database_id = "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

    day = "tuesday"

    hour = "14:00"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [day: day, hour: hour])
    expected = Map.put(expected, :path, "/databases/#{database_id}/maintenance")

    assert expected == Database.update_maintenance_window(database_id, day: day, hour: hour)
  end

  test "update_sql_mode/2" do
    database_id = "9cdb64e5-61e4-4b30-b711-11ef66d84558"

    sql_mode = "ANSI,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [sql_mode: sql_mode])
    expected = Map.put(expected, :path, "/databases/#{database_id}/sql_mode")

    assert expected == Database.update_sql_mode(database_id, sql_mode: sql_mode)
  end
end
