defmodule DigitalOcean.Monitoring do
  alias DigitalOcean.{ Operation }

  @doc """
  Create an alert policy.

  ## Examples

      iex> DigitalOcean.Monitoring.create_alert_policy(
      ...>   alerts: %{
      ...>     email: [
      ...>       "bob@example.com"
      ...>     ],
      ...>     slack: [
      ...>       %{
      ...>         channel: "Production Alerts",
      ...>         url: "https://hooks.slack.com/services/T1234567/AAAAAAAA/ZZZZZZ"
      ...>       }
      ...>     ]
      ...>   },
      ...>   compare: "GreaterThan",
      ...>   description: "CPU Alert",
      ...>   enabled: true,
      ...>   entities: [
      ...>     "192018292"
      ...>   ],
      ...>   tags: [
      ...>     "droplet_tag"
      ...>   ],
      ...>   type: "v1/insights/droplet/cpu",
      ...>   value: 80,
      ...>   window: "5m"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec create_alert_policy(Keyword.t()) :: Operation.t()
  def create_alert_policy(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/monitoring/alerts")
  end

  @doc """
  Delete an alert policy.

  ## Examples

      iex> DigitalOcean.delete_alert_policy("4de7ac8b-495b-4884-9a69-1050c6793cd6") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec delete_alert_policy(DigitalOcean.id_t()) :: Operation.t()
  def delete_alert_policy(alert_id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/monitoring/alerts/#{alert_id}")
  end

  @doc """
  Retrieve an alert policy.

  ## Examples

      iex> DigitalOcean.Monitoring.get_alert_policy("78b3da62-27e5-49ba-ac70-5db0b5935c64") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_alert_policy(DigitalOcean.id_t()) :: Operation.t()
  def get_alert_policy(alert_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/monitoring/alerts/#{alert_id}")
  end

  @doc """
  Retrieve available memory metrics for a droplet.

  ## Examples

      iex> DigitalOcean.Monitoring.get_droplet_available_memory_metrics(
      ...>   end: 1636051668,
      ...>   host_id: 222651441,
      ...>   start: 1636051668
      ...> )
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_droplet_available_memory_metrics(Keyword.t()) :: Operation.t()
  def get_droplet_available_memory_metrics(opts) do
    get_droplet_metrics("memory_available", opts)
  end

  @doc """
  Retrieve bandwidth metrics for a droplet.

  ## Examples

      iex> DigitalOcean.Monitoring.get_droplet_bandwidth_metrics(
      ...>   direction: "outbound",
      ...>   end: 1636051668,
      ...>   host_id: 222651441,
      ...>   interface: "public",
      ...>   start: 1636051668
      ...> )
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_droplet_bandwidth_metrics(Keyword.t()) :: Operation.t()
  def get_droplet_bandwidth_metrics(opts) do
    get_droplet_metrics("bandwidth", opts)
  end

  @doc """
  Retrieve cached memory metrics for a droplet.

  ## Examples

      iex> DigitalOcean.Monitoring.get_droplet_cached_memory_metrics(
      ...>   end: 1636051668,
      ...>   host_id: 222651441,
      ...>   start: 1636051668
      ...> )
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_droplet_cached_memory_metrics(Keyword.t()) :: Operation.t()
  def get_droplet_cached_memory_metrics(opts) do
    get_droplet_metrics("memory_cached", opts)
  end

  @doc """
  Retrieve CPU metrics for a droplet.

  ## Examples

      iex> DigitalOcean.Monitoring.get_droplet_cpu_metrics(
      ...>   end: 1636051668,
      ...>   host_id: 222651441,
      ...>   start: 1636051668
      ...> )
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_droplet_cpu_metrics(Keyword.t()) :: Operation.t()
  def get_droplet_cpu_metrics(opts) do
    get_droplet_metrics("cpu", opts)
  end

  @doc """
  Retrieve filesystem free metrics for a droplet.

  ## Examples

      iex> DigitalOcean.Monitoring.get_droplet_filesystem_free_metrics(
      ...>   end: 1636051668,
      ...>   host_id: 222651441,
      ...>   start: 1636051668
      ...> )
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_droplet_filesystem_free_metrics(Keyword.t()) :: Operation.t()
  def get_droplet_filesystem_free_metrics(opts) do
    get_droplet_metrics("filesystem_free", opts)
  end

  @doc """
  Retrieve filesystem size metrics for a droplet.

  ## Examples

      iex> DigitalOcean.Monitoring.get_droplet_filesystem_size_metrics(
      ...>   end: 1636051668,
      ...>   host_id: 222651441,
      ...>   start: 1636051668
      ...> )
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_droplet_filesystem_size_metrics(Keyword.t()) :: Operation.t()
  def get_droplet_filesystem_size_metrics(opts) do
    get_droplet_metrics("filesystem_size", opts)
  end

  @doc """
  Retrieve free memory metrics for a droplet.

  ## Examples

      iex> DigitalOcean.Monitoring.get_droplet_free_memory_metrics(
      ...>   end: 1636051668,
      ...>   host_id: 222651441,
      ...>   start: 1636051668
      ...> )
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_droplet_free_memory_metrics(Keyword.t()) :: Operation.t()
  def get_droplet_free_memory_metrics(opts) do
    get_droplet_metrics("memory_free", opts)
  end

  @doc """
  Retrieve 1 minute load average metrics for a droplet.

  ## Examples

      iex> DigitalOcean.Monitoring.get_droplet_load_1_metrics(
      ...>   end: 1636051668,
      ...>   host_id: 222651441,
      ...>   start: 1636051668
      ...> )
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_droplet_load_1_metrics(Keyword.t()) :: Operation.t()
  def get_droplet_load_1_metrics(opts) do
    get_droplet_metrics("load_1", opts)
  end

  @doc """
  Retrieve 5 minute load average metrics for a droplet.

  ## Examples

      iex> DigitalOcean.Monitoring.get_droplet_load_5_metrics(
      ...>   end: 1636051668,
      ...>   host_id: 222651441,
      ...>   start: 1636051668
      ...> )
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_droplet_load_5_metrics(Keyword.t()) :: Operation.t()
  def get_droplet_load_5_metrics(opts) do
    get_droplet_metrics("load_5", opts)
  end

  @doc """
  Retrieve 15 minute load average metrics for a droplet.

  ## Examples

      iex> DigitalOcean.Monitoring.get_droplet_load_15_metrics(
      ...>   end: 1636051668,
      ...>   host_id: 222651441,
      ...>   start: 1636051668
      ...> )
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_droplet_load_15_metrics(Keyword.t()) :: Operation.t()
  def get_droplet_load_15_metrics(opts) do
    get_droplet_metrics("load_15", opts)
  end

  @doc """
  Retrieve total memory metrics for a droplet.

  ## Examples

      iex> DigitalOcean.Monitoring.get_droplet_total_memory_metrics(
      ...>   end: 1636051668,
      ...>   host_id: 222651441,
      ...>   start: 1636051668
      ...> )
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_droplet_total_memory_metrics(Keyword.t()) :: Operation.t()
  def get_droplet_total_memory_metrics(opts) do
    get_droplet_metrics("memory_total", opts)
  end

  defp get_droplet_metrics(metric, opts) do
    get_metrics("droplet", metric, opts)
  end

  defp get_metrics(resource, metric, opts) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/monitoring/metrics/#{resource}/#{metric}")
  end

  @doc """
  Retrieve a list of alert policies that are configured for the given account.

  ## Examples

      iex> DigitalOcean.Monitoring.list_alert_policies() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list_alert_policies(Keyword.t()) :: Operation.t()
  def list_alert_policies(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/monitoring/alerts")
  end

  @doc """
  Update an alert policy.

  ## Examples

      iex> DigitalOcean.Monitoring.update_alert_policy(
      ...>   alerts: %{
      ...>     email: [
      ...>       "bob@example.com"
      ...>     ],
      ...>     slack: [
      ...>       %{
      ...>         channel: "Production Alerts",
      ...>         url: "https://hooks.slack.com/services/T1234567/AAAAAAAA/ZZZZZZ"
      ...>       }
      ...>     ]
      ...>   },
      ...>   compare: "GreaterThan",
      ...>   description: "CPU Alert",
      ...>   enabled: true,
      ...>   entities: [
      ...>     "192018292"
      ...>   ],
      ...>   tags: [
      ...>     "droplet_tag"
      ...>   ],
      ...>   type: "v1/insights/droplet/cpu",
      ...>   value: 80,
      ...>   window: "5m"
      ...> ) |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec update_alert_policy(DigitalOcean.id_t(), Keyword.t()) :: Operation.t()
  def update_alert_policy(alert_id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/monitoring/alerts/#{alert_id}")
  end
end
