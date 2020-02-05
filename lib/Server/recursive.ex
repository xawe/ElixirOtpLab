defmodule Server.Recursive do
  @moduledoc """
  Exemplo de implementação de chamada recursiva via Timer usando o GenServer

  #Example
   Iniciar usando GenServer.start(Server.Recursive, [])
  """
  use GenServer

  @time_count  1000

  @doc """
  Função init/1 esperada pelo GenServer.start
  """
  def init(opts) do
    Process.send_after(self(), :tick, @time_count)

    {:ok, opts}
  end


  @doc """
  # handle_info/2
  Função para tratar o tick de dados e devolver um timer formatado
  """
  def handle_info(:tick, state) do
    time =
      DateTime.utc_now()
      |> DateTime.to_time()
      |> Time.to_iso8601()

    IO.puts("The Time is now: #{time}")

    Process.send_after(self(), :tick, @time_count)
    {:noreply, state}

  end


end
