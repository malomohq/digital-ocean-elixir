defmodule DigitalOcean.Http do
  alias DigitalOcean.{ Request }

  @type response_t ::
          %{
            body: String.t(),
            headers: DigitalOcean.http_headers_t(),
            status_code: DigitalOcean.http_status_code_t()
          }

  @callback send(
              request :: Request.t(),
              opts :: any
            ) :: { :ok, response_t } | { :error, response_t | any }
end
