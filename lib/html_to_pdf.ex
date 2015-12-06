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

  def set_footer_html(document, html_url) do
    document
    |> HtmlToPdf.Document.put_option("--footer-html", html_url)
  end

  def set_left_footer_text(document, text) do
    document
    |> HtmlToPdf.Document.put_option("--footer-left", text)
  end

  def set_center_footer_text(document, text) do
    document
    |> HtmlToPdf.Document.put_option("--footer-center", text)
  end

  def set_right_footer_text(document, text) do
    document
    |> HtmlToPdf.Document.put_option("--footer-right", text)
  end

  def set_footer_font(document, [family: family]) do
    document
    |> HtmlToPdf.Document.put_option("--footer-font-name", family)
  end

  def set_footer_font(document, [size: size]) do
    document
    |> HtmlToPdf.Document.put_option("--footer-font-size", Integer.to_string(size))
  end

  def set_footer_font(document, [family: family, size: size]) do
    document
    |> HtmlToPdf.Document.put_option("--footer-font-name", family)
    |> HtmlToPdf.Document.put_option("--footer-font-size", Integer.to_string(size))
  end

  def set_footer_spacing(document, spacing) do
    document
    |> HtmlToPdf.Document.put_option("--footer-spacing", Integer.to_string(spacing))
  end

  def add_footer_line(document) do
    document
    |> HtmlToPdf.Document.put_option("--footer-line", "")
  end

  def generate_pdf(document) do
    document
      = document
        |> HtmlToPdf.Document.put_option("--encoding", "utf-8")

    {:ok, html_file_path} = HtmlToPdf.TempFile.write(:html, document.html)

    pdf_file_path = HtmlToPdf.TempFile.filepath("pdf")

    HtmlToPdf.Wkhtmltopdf.execute(html_file_path, pdf_file_path, document.options |> options_map_to_list)
  end

  def options_map_to_list(options) do
    Enum.map(options, fn {k, v} ->
      case {k, v} do
        {k, ""} ->
          [k]
        {k, nil} ->
          [k]
        {k, v} ->
          [k, v]
      end
    end) |> List.flatten
  end

end
