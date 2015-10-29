defmodule HtmlToPdf.Timestamp do

  def generate do
    Tuple.to_list(:os.timestamp) |> Enum.join
  end

end
