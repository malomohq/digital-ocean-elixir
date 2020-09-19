defmodule DigitalOcean.Http.Hackney do
  @behaviour DigitalOcean.Http

  @impl true
  def request(method, url, headers, body, opts) do
    opts = opts ++ [:with_body]

    response =
      :hackney.request(
        method,
        url,
        headers,
        body,
        opts
      )

    case response do
      { :ok, status_code, headers } ->
        { :ok, %{ body: "", headers: headers, status_code: status_code } }
      { :ok, status_code, headers, body } ->
        { :ok, %{ body: body, headers: headers, status_code: status_code } }
      otherwise ->
        otherwise
    end
  end
end
