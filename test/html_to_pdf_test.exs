defmodule HtmlToPdfTest do
  use ExUnit.Case
  doctest HtmlToPdf

  test "sets the html of the document" do
    test_html = "<h1>Hello World</h1>"

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_html(test_html)

    assert document.html == test_html
  end

  test "adds the dpi of the document to the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_dpi(300)

    assert document.options == %{"--dpi" => "300"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_dpi(700)

    assert document.options == %{"--dpi" => "700"}
  end
end
