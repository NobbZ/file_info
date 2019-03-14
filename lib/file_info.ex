defmodule FileInfo do
  @moduledoc """
  This module is to get some information about files. Currently it just gives
  you the files MIME-type in a string representation.
  """

  @doc """
  Retrieves informations about one or multiple files, using the `file` command
  line tool which is shipped with most linux distributions.
  """
  @spec get_info(Path.t() | [Path.t()]) :: %{Path.t() => FileInfo.Mime.t()}
  def get_info(names)
  def get_info(name) when is_binary(name), do: get_info([name])

  def get_info(names) when is_list(names) do
    {result, 0} = System.cmd("file", ["--mime-type" | names])

    result
    |> String.split("\n")
    |> Stream.filter(&(&1 !== ""))
    |> Stream.map(&String.split(&1, ": "))
    |> Stream.map(&to_tuple/1)
    |> Enum.into(%{})
  end

  defp to_tuple([path, mime]) do
    mime = mime |> String.strip() |> FileInfo.Mime.parse!()
    {path, mime}
  end
end
