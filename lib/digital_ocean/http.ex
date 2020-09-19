defmodule DigitalOcean.Http do
  @type response_t ::
          %{
            body: String.t(),
            headers: DigitalOcean.http_headers_t(),
            status_code: DigitalOcean.http_status_code_t()
          }

  @callback request(
              method :: DigitalOcean.http_method_t(),
              url :: String.t(),
              headers :: DigitalOcean.http_headers_t(),
              body :: String.t(),
              opts :: any
            ) :: { :ok, response_t } | { :error, response_t | any }
end
