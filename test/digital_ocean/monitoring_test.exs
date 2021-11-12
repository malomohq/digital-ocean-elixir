defmodule DigitalOcean.MonitoringTest do
  use ExUnit.Case, async: true

  alias DigitalOcean.{ Monitoring, Operation }

  test "create_alert_policy/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/alerts")

    assert expected == Monitoring.create_alert_policy(p1: "v")
  end

  test "delete_alert_policy/1" do
    alert_id = "4de7ac8b-495b-4884-9a69-1050c6793cd6"

    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/monitoring/alerts/#{alert_id}")

    assert expected == Monitoring.delete_alert_policy(alert_id)
  end

  test "get_alert_policy/1" do
    alert_id = "78b3da62-27e5-49ba-ac70-5db0b5935c64"

    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/monitoring/alerts/#{alert_id}")

    assert expected == Monitoring.get_alert_policy(alert_id)
  end

  test "get_droplet_available_memory_metrics/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/metrics/droplet/memory_available")

    assert expected == Monitoring.get_droplet_available_memory_metrics(p1: "v")
  end

  test "get_droplet_bandwidth_metrics/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/metrics/droplet/bandwidth")

    assert expected == Monitoring.get_droplet_bandwidth_metrics(p1: "v")
  end

  test "get_droplet_cached_memory_metrics/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/metrics/droplet/memory_cached")

    assert expected == Monitoring.get_droplet_cached_memory_metrics(p1: "v")
  end

  test "get_droplet_cpu_metrics/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/metrics/droplet/cpu")

    assert expected == Monitoring.get_droplet_cpu_metrics(p1: "v")
  end

  test "get_droplet_filesystem_free_metrics/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/metrics/droplet/filesystem_free")

    assert expected == Monitoring.get_droplet_filesystem_free_metrics(p1: "v")
  end

  test "get_droplet_filesystem_size_metrics/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/metrics/droplet/filesystem_size")

    assert expected == Monitoring.get_droplet_filesystem_size_metrics(p1: "v")
  end

  test "get_droplet_free_memory_metrics/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/metrics/droplet/memory_free")

    assert expected == Monitoring.get_droplet_free_memory_metrics(p1: "v")
  end

  test "get_droplet_load_1_metrics/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/metrics/droplet/load_1")

    assert expected == Monitoring.get_droplet_load_1_metrics(p1: "v")
  end

  test "get_droplet_load_5_metrics/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/metrics/droplet/load_5")

    assert expected == Monitoring.get_droplet_load_5_metrics(p1: "v")
  end

  test "get_droplet_load_15_metrics/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/metrics/droplet/load_15")

    assert expected == Monitoring.get_droplet_load_15_metrics(p1: "v")
  end

  test "get_droplet_total_memory_metrics/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/metrics/droplet/memory_total")

    assert expected == Monitoring.get_droplet_total_memory_metrics(p1: "v")
  end

  test "list_alert_policies/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/alerts")

    assert expected == Monitoring.list_alert_policies(p1: "v")
  end

  test "update_alert_policy/2" do
    alert_id = "78b3da62-27e5-49ba-ac70-5db0b5935c64"

    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/monitoring/alerts/#{alert_id}")

    assert expected ==  Monitoring.update_alert_policy(alert_id, p1: "v")
  end
end
