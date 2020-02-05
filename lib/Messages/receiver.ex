defmodule Message.Receiver do
  @moduledoc """
  Modulo responsável por receber chamadas através da função listen

  # Examples
  pid = spawn(Message.Receiver, [])

  send pid, {:ok, "hello"}

  """

  @doc """
  Função recursiva responsável por responder a uma chamada de SEND.
  Se recebida a mensagem "hello", retorna o texto "world"
  """
  def listen do
    receive do
      {:ok, "hello"} -> IO.puts("world")
    end
    listen()
  end
end
