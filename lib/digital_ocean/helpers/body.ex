defmodule DigitalOcean.Helpers.Body do
  @moduledoc false

  alias DigitalOcean.{ Config, Operation }

  @spec encode!(Operation.t(), Config.t()) :: String.t()
  def encode!(%_{ method: :get }, _config) do
    ""
  end

  def encode!(operation, config) do
    operation.params
    |> Enum.into(%{})
    |> config.json_codec.encode!()
  end
end
