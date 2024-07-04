defmodule CronJobsTest do
  use ExUnit.Case
  doctest CronJobs

  test "greets the world" do
    assert CronJobs.hello() == :world
  end
end
