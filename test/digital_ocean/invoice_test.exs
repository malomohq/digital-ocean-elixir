defmodule DigitalOcean.InvoiceTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Invoice, Operation }

  test "get/1" do
    invoice_id = "22737513-0ea7-4206-8ceb-98a575af7681"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/customers/my/invoices/#{invoice_id}")

    assert expected == Invoice.get(invoice_id)
  end

  test "get_csv/1" do
    invoice_id = "22737513-0ea7-4206-8ceb-98a575af7681"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/customers/my/invoices/#{invoice_id}/csv")

    assert expected == Invoice.get_csv(invoice_id)
  end

  test "get_pdf/1" do
    invoice_id = "22737513-0ea7-4206-8ceb-98a575af7681"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/customers/my/invoices/#{invoice_id}/pdf")

    assert expected == Invoice.get_pdf(invoice_id)
  end

  test "get_summary/1" do
    invoice_id = "22737513-0ea7-4206-8ceb-98a575af7681"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/customers/my/invoices/#{invoice_id}/summary")

    assert expected == Invoice.get_summary(invoice_id)
  end

  test "list/1" do
    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, page: page)
    expected = Map.put(expected, :path, "/customers/my/invoices")

    assert expected == Invoice.list(page: page)
  end
end
