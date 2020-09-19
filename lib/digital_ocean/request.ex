defmodule DigitalOcean.Request do
  alias DigitalOcean.{ Config, Helpers, Operation, Response }

  @spec send(Operation.t(), map) :: DigitalOcean.http_response_t()
  def send(operation, config \\ %{}) do
    config = Config.new(config)

    method = operation.method

    url = Helpers.Url.to_string(operation, config)

    headers = []
    headers = headers ++ [{ "content-type", "application/json" }]
    headers = headers ++ [{ "authorization", "Bearer #{config.access_token}" }]

    body = Helpers.Body.encode!(operation, config)

    http_client_opts = config.http_client_opts

    result =
      config.http_client.request(
        method,
        url,
        headers,
        body,
        http_client_opts
      )

    case result do
      { :ok, %{ status_code: status_code } = response } when status_code >= 400 ->
        { :error, Response.new(response, config) }
      { :ok, %{ status_code: status_code } = response } when status_code >= 200 ->
        { :ok, Response.new(response, config) }
      otherwise ->
        otherwise
    end
  end
end
