defmodule DigitalOcean.Response do
  alias DigitalOcean.{ Config, Http }

  defstruct [:body, :headers, :status_code]

  @type t ::
          %__MODULE__{
            body: String.t(),
            headers: DigitalOcean.http_headers_t(),
            status_code: DigitalOcean.http_status_code_t()
          }

  @spec new(Http.response_t(), Config.t()) :: t
  def new(response, config) do
    body =
      response
      |> Map.get(:body)
      |> config.json_codec.decode!()

    %__MODULE__{}
    |> Map.put(:body, body)
    |> Map.put(:headers, Map.get(response, :headers))
    |> Map.put(:status_code, Map.get(response, :status_code))
  end
end
