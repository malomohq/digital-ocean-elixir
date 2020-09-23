defmodule DigitalOcean.Config do
  defstruct [
    access_token: nil,
    http_client: DigitalOcean.Http.Hackney,
    http_client_opts: [],
    http_host: "api.digitalocean.com",
    http_path_prefix: "/v2",
    http_port: nil,
    http_protocol: "https",
    json_codec: Jason,
    retry: false,
    retry_opts: []
  ]

  @type t ::
          %__MODULE__{
            access_token: String.t(),
            http_client: module,
            http_client_opts: any,
            http_host: String.t(),
            http_path_prefix: String.t(),
            http_port: pos_integer,
            http_protocol: String.t(),
            json_codec: module,
            retry: boolean | module,
            retry_opts: Keyword.t()
          }

  @spec new(map) :: t
  def new(overrides) do
    Map.merge(%__MODULE__{}, overrides)
  end
end
