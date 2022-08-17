defmodule OptSupervisor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: OptSupervisor.Worker.start_link(arg)
      # {OptSupervisor.Worker, arg}
      {Sequence.Stash, 123},
      {Sequence.Api, nil},
      {Stack.Api, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: OptSupervisor.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
