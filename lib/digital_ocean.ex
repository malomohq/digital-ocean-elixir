defmodule DigitalOcean do
  alias DigitalOcean.{ Operation, Request, Response }

  @type http_headers_t ::
          [{ String.t(), String.t() }]

  @type http_method_t ::
          :delete | :get | :head | :patch | :post | :put

  @type http_response_t ::
          { :ok, Response.t() } | { :error, Response.t() | any }

  @type http_status_code_t ::
          pos_integer

  @type id_t ::
          String.t() | integer

  @spec request(Operation.t(), Keyword.t()) :: http_response_t
  def request(operation, config \\ []) do
    Request.send(operation, Enum.into(config, %{}))
  end
end
