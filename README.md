# DigitalOcean v2 API client for Elixir

## Installation

`digital_ocean` is published on Hex. Add it to your list of dependencies in
`mix.exs`:

```elixir
defp deps do
  { :digital_ocean, "~> 0.2.0" }
end
```

`digital_ocean` requires you to provide an HTTP client and JSON codec. `hackney`
and `jason` are used by default. If you wish to use these defaults you will
also need to specify `hackney` and `jason` as dependencies.

## Usage

Each resource module (e.g. `DigitalOcean.Droplet`) provides functions for
building a request that can be sent to the DigitalOcean v2 API using the
`DigitalOcean.request/2` function.

**Example**

```elixir
DigitalOcean.Account.get() |> DigitalOcean.request(access_token: "...")
```

For details on individual resource types [please see our documentation on
HexDocs](https://hexdocs.pm/digital_ocean).

## Configuration

All configuration must be provided on a per-request basis as a keyword list to
the second argument of `DigitalOcean.request/2`.

Possible configuration values are provided below:

* `:access_token` - an OAuth access token or a personal access token used by
  DigitalOcean to authenticate your requests
* `:http_client` - client used when making HTTP requests. Defaults to
  `DigitalOcean.Http.Hackney`.
* `:http_client_opts` - options or configuration passed to the HTTP client when
  a request is made. Defaults to `[]`.
* `:http_host` - host used to send requests to. Defaults to
  `api.digitalocean.com`.
* `:http_path_prefix` - path prefixed to all request URLs. Defaults to `/v2`.
* `:http_port` - port to send requests to
* `:http_protocol` - protocol used when sending requests. Defaults to `https`.
* `:json_codec` - JSON codec used to encode/decode request and response bodies.
  Defaults to `Jason`.
* `:retry` - module implementing a strategy for retrying requests. Disabled when
  set to `false`. Defaults to `false`.
* `:retry_opts` - options for configuring retry behavior. Defaults to `[]`.
  * `:max_attempts` - the number of attempts before failing a request. Defaults
    to `3`.

## Retries

`digital_ocean` has a built-in mechanism for retrying requests that either
return an HTTP status code of 500 or a client error. You can enabled retries
by providing a module that implements the `DigitalOcean.Retry` behaviour to the
`:retry` option when calling `DigitalOcean.request/2`.

Currently, `digital_ocean` provides a `DigitalOcean.Retry.Linear` strategy for
retrying requests. This strategy will automatically retry a request on a set
interval. You can configure the interval by adding `:retry_in` with the number
of milliseconds to wait before sending another request to the `:retry_opts`
option.

**Example**

```elixir
DigitalOcean.Account.get() |> DigitalOcean.request(retry: DigitalOcean.Retry.Linear, retry_opts: [retry_in: 250])
```

The example above would retry a failed request after 250 milliseconds. By
default `DigitalOcean.Retry.Linear` will retry a request immediately if
`:retry_in` has no value
