defmodule HtmlToPdf.TempFile do

  def write(contents) do
    tmp_filepath = filepath

    tmp_filepath |> File.touch!

    tmp_filepath
    |> File.open!([:write])
    |> IO.binwrite(contents)
    |> File.close

    {:ok, tmp_filepath}
  end

  def filepath do
    timestamp = HtmlToPdf.Timestamp.generate
    random_number = HtmlToPdf.Random.generate

    System.tmp_dir |> Path.join("tmp_#{timestamp}_#{random_number}")
  end

end
