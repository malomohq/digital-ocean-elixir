defmodule DigitalOcean.Invoice do
  alias DigitalOcean.{Operation}

  @doc """
  Retrieve an invoice.

  ## Examples

      iex> DigitalOcean.Invoice.get("22737513-0ea7-4206-8ceb-98a575af7681") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get(String.t()) :: Operation.t()
  def get(invoice_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/customers/my/invoices/#{invoice_id}")
  end

  @doc """
  Retrieve a CSV for an invoice.

  ## Examples

      iex> DigitalOcean.Invoice.get_csv("22737513-0ea7-4206-8ceb-98a575af7681") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_csv(String.t()) :: Operation.t()
  def get_csv(invoice_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/customers/my/invoices/#{invoice_id}/csv")
  end

  @doc """
  Retrieve a PDF for an invoice.

  ## Examples

      iex> DigitalOcean.Invoice.get_pdf("22737513-0ea7-4206-8ceb-98a575af7681") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_pdf(String.t()) :: Operation.t()
  def get_pdf(invoice_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/customers/my/invoices/#{invoice_id}/pdf")
  end

  @doc """
  Retrieve the summary for an invoice.

  ## Examples

      iex> DigitalOcean.Invoice.get_summary("22737513-0ea7-4206-8ceb-98a575af7681") |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec get_summary(String.t()) :: Operation.t()
  def get_summary(invoice_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/customers/my/invoices/#{invoice_id}/summary")
  end

  @doc """
  Retrieve a list of invoices.

  ## Examples

      iex> DigitalOcean.Invoice.list() |> DigitalOcean.request()
      { :ok, %DigitalOcean.Response{} }
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/customers/my/invoices")
  end
end
