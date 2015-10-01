defmodule Geo.Supervisor do
  @moduledoc false
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    children = [
      supervisor(Geo.Region.Supervisor, [])
    ]

    opts = [strategy: :one_for_one]
    supervise(children, opts)
  end
end
