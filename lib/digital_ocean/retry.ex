defmodule DigitalOcean.Retry do
  alias DigitalOcean.{ Config, Request }

  @callback wait_for(request :: Request.t(), config :: Config.t()) :: non_neg_integer
end
