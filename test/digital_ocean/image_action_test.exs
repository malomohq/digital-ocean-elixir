defmodule DigitalOcean.ImageActionTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ ImageAction, Operation }

  test "create/2" do
    image_id = 7938291

    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/images/#{image_id}/actions")

    assert expected == ImageAction.create(image_id, p1: "v")
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

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/images/#{image_id}/actions")

    assert expected == ImageAction.list(image_id, p1: "v")
  end
end
