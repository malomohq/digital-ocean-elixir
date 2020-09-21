defmodule DigitalOcean.Database do
  alias DigitalOcean.{ Operation }

  @doc """
  Create a new database cluster or create a database cluster from a backup.

  ## Example creating a database cluster

      iex> DigitalOcean.Database.create(
      ...>   name: "backend",
      ...>   region: "nyc3",
      ...>   engine: "pg",
      ...>   size: "db-s-2vcpu-4gb",
      ...>   num_nodes: 2
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }

  ## Example creating a database cluster from a backup

      iex> DigitalOcean.Database.create(
      ...>   name: "backend",
      ...>   region: "nyc3",
      ...>   engine: "pg",
      ...>   size: "db-s-2vcpu-4gb",
      ...>   num_nodes: 2,
      ...>   backup_restore: %{
      ...>     database_name: "backend",
      ...>     backup_created_at: "2019-01-31T19:25:22Z"
      ...>   },
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases")
  end

  @doc """
  Create a PostgreSQL connection pool for a database cluster.

  ## Examples

      iex> DigitalOcean.Database.create_connection_pool(
      ...>   "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30",
      ...>   name: "backend-pool",
      ...>   mode: "transaction",
      ...>   size: 10,
      ...>   db: "default_db",
      ...>   user: "doadmin"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create_connection_pool(String.t(), Keyword.t()) :: Operation.t()
  def create_connection_pool(database_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/pools")
  end

  @doc """
  Create a database for a database cluster.

  ## Examples

      iex> DigitalOcean.Database.create_db(
      ...>   "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30",
      ...>   name: "alpha"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create_db(String.t(), Keyword.t()) :: Operation.t()
  def create_db(database_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/dbs")
  end

  @doc """
  Create a read-only replica.

  ## Examples

      iex> DigitalOcean.Database.create_replica(
      ...>   "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30",
      ...>   name: "read-nyc3-01",
      ...>   size: "db-s-2vcpu-4gb"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create_replica(String.t(), Keyword.t()) :: Operation.t()
  def create_replica(database_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/replicas")
  end

  @doc """
  Create a user for a database.

  ## Examples

      iex> DigitalOcean.Database.create_user(
      ...>   "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30",
      ...>   name: "app-01"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create_user(String.t(), Keyword.t()) :: Operation.t()
  def create_user(database_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/users")
  end

  @doc """
  Delete a database cluster.

  ## Examples

      iex> DigitalOcean.Database.delete("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(database_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/databases/#{database_id}")
  end

  @doc """
  Delete a PostgreSQL connection pool.

  ## Examples

      iex> DigitalOcean.Database.delete_connection_pool("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", "backend-pool") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_connection_pool(String.t(), String.t()) :: Operation.t()
  def delete_connection_pool(database_id, connection_pool_name) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/databases/#{database_id}/pools/#{connection_pool_name}")
  end

  @doc """
  Delete a database from a database cluster.

  ## Examples

      iex> DigitalOcean.Database.delete_db("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", "alpha") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_db(String.t(), String.t()) :: Operation.t()
  def delete_db(database_id, db_name) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/databases/#{database_id}/dbs/#{db_name}")
  end

  @doc """
  Delete a read-only database replica.

  ## Examples

      iex> DigitalOcean.Database.delete_replica("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", "read-nyc3-01") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_replica(String.t(), String.t()) :: Operation.t()
  def delete_replica(database_id, replica_name) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/databases/#{database_id}/replicas/#{replica_name}")
  end

  @doc """
  Delete a user from a database.

  ## Examples

      iex> DigitalOcean.Database.delete_user("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", "app-01") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_user(String.t(), String.t()) :: Operation.t()
  def delete_user(database_id, username) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/databases/#{database_id}/users/#{username}")
  end

  @doc """
  Retrieve details about a specific database cluster.

  ## Examples

      iex> DigitalOcean.Database.get("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t()) :: Operation.t()
  def get(database_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/databases/#{database_id}")
  end

  @doc """
  Retrieve details about a Redis eviction policy.

  ## Examples

      iex> DigitalOcean.Database.get_eviction_policy("9cdb64e5-61e4-4b30-b711-11ef66d84558") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_eviction_policy(String.t()) :: Operation.t()
  def get_eviction_policy(database_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/databases/#{database_id}/eviction_policy")
  end

  @doc """
  Retrieve details about a specific PostgreSQL connection pool.

  ## Examples

      iex> DigitalOcean.Database.get_connection_pool("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", "backend-pool") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_connection_pool(String.t(), String.t()) :: Operation.t()
  def get_connection_pool(database_id, connection_pool_name) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/databases/#{database_id}/pools/#{connection_pool_name}")
  end

  @doc """
  Retrieve details about a specific database.

  ## Examples

      iex> DigitalOcean.Database.get("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", "alpha") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_db(String.t(), String.t()) :: Operation.t()
  def get_db(database_id, db_name) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/databases/#{database_id}/dbs/#{db_name}")
  end

  @doc """
  Retrieve details about a specific read-only database replica.

  ## Examples

      iex> DigitalOcean.Database.get_replica("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", "read-nyc3-01") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_replica(String.t(), String.t()) :: Operation.t()
  def get_replica(database_id, replica_name) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/databases/#{database_id}/replicas/#{replica_name}")
  end

  @doc """
  Retrieve the SQL mode for a MySQL database cluster.

  ## Example

      iex> DigitalOcean.Database.get_sql_mode("9cdb64e5-61e4-4b30-b711-11ef66d84558") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_sql_mode(String.t()) :: Operation.t()
  def get_sql_mode(database_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/databases/#{database_id}/sql_mode")
  end

  @doc """
  Retrieve details about a specific user for a database.

  ## Examples

      iex> DigitalOcean.Database.get_user("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", "app-01") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_user(String.t(), String.t()) :: Operation.t()
  def get_user(database_id, username) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/databases/#{database_id}/users/#{username}")
  end

  @doc """
  Retrieve a list of database clusters.

  ## Examples

      iex> DigitalOcean.Database.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases")
  end

  @doc """
  Retrieve a list of backups for a database cluster.

  ## Examples

      iex> DigitalOcean.Database.list_backups("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_backups(String.t(), Keyword.t()) :: Operation.t()
  def list_backups(database_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/backups")
  end

  @doc """
  Retrieve a list fo connection pools for a PostgreSQL database cluster.

  ## Examples

      iex> DigitalOcean.Database.list_connection_pools("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_connection_pools(String.t(), Keyword.t()) :: Operation.t()
  def list_connection_pools(database_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/pools")
  end

  @doc """
  Retrieve a list of databases for a database cluster.

  ## Examples

      iex> DigitalOcean.Database.list_dbs("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_dbs(String.t(), Keyword.t()) :: Operation.t()
  def list_dbs(database_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/dbs")
  end

  @doc """
  Retrieve a list of firewall rules for a database cluster.

  ## Examples

      iex> DigitalOcean.Database.list_firewall_rules("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_firewall_rules(String.t(), Keyword.t()) :: Operation.t()
  def list_firewall_rules(database_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/firewall")
  end

  @doc """
  Retrieve a list of read-only database replicas.

  ## Example

      iex> DigitalOcean.Database.list_replicas("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_replicas(String.t(), Keyword.t()) :: Operation.t()
  def list_replicas(database_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/replicas")
  end

  @doc """
  Retrieve a list of users for a database.

  ## Examples

      iex> DigitalOcean.Database.list_users("9cc10173-e9ea-4176-9dbc-a4cee4c4ff30") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_users(String.t(), Keyword.t()) :: Operation.t()
  def list_users(database_id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/users")
  end

  @doc """
  Migrate a database cluster to a different region.

  ## Examples

      iex> DigitalOcean.Database.migrate_to_region(
      ...>   "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30",
      ...>   region: "lon1"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec migrate_to_region(String.t(), Keyword.t()) :: Operation.t()
  def migrate_to_region(database_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/migrate")
  end

  @doc """
  Reset the MySQL authentication method for a database user.

  ## Examples

      iex> DigitalOcean.Database.reset_user_authentication_method(
      ...>   "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30",
      ...>   "app-01",
      ...>   mysql_settings: %{ auth_plugin: "caching_sha2_password" }
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec reset_user_authentication_method(String.t(), String.t(), Keyword.t()) :: Operation.t()
  def reset_user_authentication_method(database_id, username, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/users/#{username}/reset_auth")
  end

  @doc """
  Resize a database cluster.

  ## Examples

      iex> DigitalOcean.Database.resize(
      ...>   "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30",
      ...>   size: "db-s-4vcpu-8gb",
      ...>   num_nodes: 3
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec resize(String.t(), Keyword.t()) :: Operation.t()
  def resize(database_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/resize")
  end

  @doc """
  Update the eviction policy for a Redis database cluster.

  ## Examples

      iex> DigitalOcean.Database.update_eviction_policy(
      ...>   "9cdb64e5-61e4-4b30-b711-11ef66d84558",
      ...>   eviction_policy: "allkeys_lru"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update_eviction_policy(String.t(), Keyword.t()) :: Operation.t()
  def update_eviction_policy(database_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/eviction_policy")
  end

  @doc """
  Update firewall rules for a database cluster.

  ## Examples
      iex> DigitalOcean.Database.update_firewall_rules(
      ...>   "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30",
      ...>   rules: [
      ...>     %{
      ...>        type: "ip_addr",
      ...>        value: "192.168.1.1"
      ...>      }
      ...>   ]
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update_firewall_rules(String.t(), Keyword.t()) :: Operation.t()
  def update_firewall_rules(database_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/firewall")
  end

  @doc """
  Update the automatic maintenance window for a database cluster.

  ## Examples

      iex> DigitalOcean.Database.update_maintenance_window(
      ...>   "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30",
      ...>   day: "tuesday",
      ...>   hour: "14:00"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update_maintenance_window(String.t(), Keyword.t()) :: Operation.t()
  def update_maintenance_window(database_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/maintenance")
  end

  @doc """
  Update the SQL mode for a MySQL database cluster.

  ## Examples

      iex> DigitalOcean.Database.update_sql_mode(
      ...>   "9cdb64e5-61e4-4b30-b711-11ef66d84558",
      ...>   sql_mode: "ANSI,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update_sql_mode(String.t(), Keyword.t()) :: Operation.t()
  def update_sql_mode(database_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/databases/#{database_id}/sql_mode")
  end
end
