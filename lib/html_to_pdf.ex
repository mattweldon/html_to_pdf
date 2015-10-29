defmodule HtmlToPdf do

  def set_html(document, html) do
    %{document | html: html}
  end

  def set_dpi(document, dpi) do
    document
    |> HtmlToPdf.Document.put_option("--dpi", dpi |> Integer.to_string)
  end

  def set_top_margin(document, top_margin) do
    document
    |> HtmlToPdf.Document.put_option("--margin-top", top_margin |> Integer.to_string)
  end

  def set_right_margin(document, right_margin) do
    document
    |> HtmlToPdf.Document.put_option("--margin-right", right_margin |> Integer.to_string)
  end

  def set_bottom_margin(document, bottom_margin) do
    document
    |> HtmlToPdf.Document.put_option("--margin-bottom", bottom_margin |> Integer.to_string)
  end

  def set_left_margin(document, left_margin) do
    document
    |> HtmlToPdf.Document.put_option("--margin-left", left_margin |> Integer.to_string)
  end

  def print_portrait(document) do
    document
    |> HtmlToPdf.Document.put_option("--orientation", "Portrait")
  end

  def print_landscape(document) do
    document
    |> HtmlToPdf.Document.put_option("--orientation", "Landscape")
  end

  def generate_pdf(document) do
    {:ok, html_file_path} = HtmlToPdf.TempFile.write(:html, document.html)
    IO.inspect HtmlToPdf.TempFile.filepath("pdf")
    HtmlToPdf.Wkhtmltopdf.execute(html_file_path, HtmlToPdf.TempFile.filepath("pdf"))
  end

end
