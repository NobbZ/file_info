defmodule FileInfo.Mime do
  @derive Inspect
  defstruct type: "", subtype: "", arguments: %{}
  @type t :: %__MODULE__{type: String.t, subtype: String.t, arguments: %{}}

  def parse(mime_string) do
    case MimetypeParser.parse mime_string do
      {:ok, {type, subtype, args}} -> {:ok, %__MODULE__{type:      type,
                                                        subtype:   subtype,
                                                        arguments: args}}
      error_tuple -> error_tuple
    end
  end

  def parse!(mime_string) do
    [{type, subtype, args}] = MimetypeParser.parse! mime_string
    %__MODULE__{type: type, subtype: subtype, arguments: args}
  end
end

defimpl String.Chars, for: FileInfo.Mime do
  alias FileInfo.Mime, as: MIME

  def to_string(%MIME{type: type, subtype: subtype, arguments: %{}}) do
    "#{type}/#{subtype}"
  end

  def to_string(%MIME{type: type, subtype: subtype, arguments: args}) do
    "#{type}/#{subtype}---ARGS CURRENTLY NOT SUPPORTED (#{args})---"
  end
end
