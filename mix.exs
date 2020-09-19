defmodule DigitalOcean.MixProject do
  use Mix.Project

  def project do
    [
      app: :digital_ocean,
      version: "0.0.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end
end
