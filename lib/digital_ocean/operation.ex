defmodule DigitalOcean.Operation do
  @type t ::
          %__MODULE__{
            headers: DigitalOcean.http_headers_t(),
            method: DigitalOcean.http_method_t(),
            params: Keyword.t(),
            path: String.t()
          }

  defstruct headers: [],
            method: nil,
            params: [],
            path: nil
end
