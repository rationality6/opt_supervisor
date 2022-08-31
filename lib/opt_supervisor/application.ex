defmodule OptSupervisor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # sequence
      {Sequence.Stash, []},
      {Sequence.Server, []},
      # stack
      {Stack.Stash, []},
      {Stack.Server, []},
      # sort
      {Sort.Stash, []},
      {Sort.Server, []},
      # ticker
      Ticker.Server,
      Ticker.Client,
      # key value
      KeyValue.Server
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: OptSupervisor.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
