defmodule HtmlToPdf do

  def set_html(document, html) do
    %{document | html: html}
  end

  def set_dpi(document, dpi) do
    document
    |> HtmlToPdf.Document.put_option("--dpi", dpi |> Integer.to_string)
  end

end
