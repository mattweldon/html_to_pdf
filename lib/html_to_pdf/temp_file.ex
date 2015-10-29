defmodule HtmlToPdf.TempFile do

  def write(:html, contents) do
    tmp_filepath = filepath("html")

    tmp_filepath |> File.touch!

    tmp_filepath
    |> File.open!([:write])
    |> IO.binwrite(contents)
    |> File.close

    {:ok, tmp_filepath}
  end

  def filepath(extension) do
    timestamp = HtmlToPdf.Timestamp.generate
    random_number = HtmlToPdf.Random.generate

    System.tmp_dir |> Path.join("tmp_#{timestamp}_#{random_number}.#{extension}")
  end

end
