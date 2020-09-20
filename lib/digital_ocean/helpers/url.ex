defmodule DigitalOcean.Helpers.Url do
  @moduledoc false

  alias DigitalOcean.{ Config, Operation }

  @spec to_string(Operation.t(), Config.t()) :: String.t()
  def to_string(operation, config) do
    operation
    |> to_uri(config)
    |> URI.to_string()
  end

  @spec to_uri(Operation.t(), Config.t()) :: URI.t()
  def to_uri(operation, config) do
    %URI{}
    |> Map.put(:scheme, config.http_protocol)
    |> Map.put(:host, config.http_host)
    |> Map.put(:port, config.http_port)
    |> Map.put(:path, "#{config.http_path_prefix}#{operation.path}")
    |> put_query(operation)
  end

  defp put_query(uri, %_{ method: method, params: params })
       when (method == :delete or method == :get) and not is_nil(params) do
    Map.put(uri, :query, URI.encode_query(params))
  end

  defp put_query(uri, _operation) do
    uri
  end
end
