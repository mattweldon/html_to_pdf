defmodule HtmlToPdf.WkhtmltopdfTest do
  use ExUnit.Case

  test "calls the wkhtmltopdf executable and returns the path to the generated file" do
    html_file
      = File.cwd!
        |> Path.join("test")
        |> Path.join("support")
        |> Path.join("test.html")

    pdf_file
      = File.cwd!
        |> Path.join("test")
        |> Path.join("support")
        |> Path.join("test1.pdf")

    result = HtmlToPdf.Wkhtmltopdf.execute(html_file, pdf_file, [])

    File.rm!(pdf_file)

    assert {:ok, pdf_filename} = result
    assert pdf_filename == pdf_file
  end
end
