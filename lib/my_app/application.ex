defmodule MyApp.Application do
  use Application

  def start(_type, _args) do

    MyApp.Supervisor.start_link(1)
  end
end
