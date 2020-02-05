defmodule Exe do
  @moduledoc """
  Classe de teste para geração de executavel usando escript
  """

  @doc """
  Hello world.

  ## Examples

      iex> Exe.hello()
      :world

  """
  def hello do
    :hello
  end

  @doc """
  Função main da aplicação, necessária para criação do executavel com ESCRIPT
  # main/1
   args >> recebe argumentos ao invocar a aplicação
  ## Example
    ./exe --upcase "texto para conversão em upcase"
  """
  def main(args \\ []) do
    args
    |> parse_args
    |> response
    |>IO.puts()
  end

  @doc """
  Método responsável por executar o parse dos argumentos informados.

  #args > representa os argumentos a serem parseados
  """
  defp parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [upcase: :boolean])

      {opts, List.to_string(word)}
  end


  @doc """
  função responsável por identificar o recebimento da tratativa upcase.
  """
  defp response({opts, word}) do
    if opts[:upcase], do: String.upcase(word), else: word
  end

end
