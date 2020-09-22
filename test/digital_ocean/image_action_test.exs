defmodule DigitalOcean.ImageActionTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ ImageAction, Operation }

  test "create/2" do
    image_id = 7938291

    params = Keyword.new()
    params = Keyword.put(params, :type, "transer")
    params = Keyword.put(params, :region, "nyc2")

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, params)
    expected = Map.put(expected, :path, "/images/#{image_id}/actions")

    assert expected == ImageAction.create(image_id, params)
  end

  test "get/2" do
    image_id = 7938269

    action_id = 36805527

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/images/#{image_id}/actions/#{action_id}")

    assert expected == ImageAction.get(image_id, action_id)
  end

  test "list/2" do
    image_id = 7555620

    page = 1

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [page: page])
    expected = Map.put(expected, :path, "/images/#{image_id}/actions")

    assert expected == ImageAction.list(image_id, page: page)
  end
end
