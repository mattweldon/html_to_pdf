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

  test "adds the top margin of the document to the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_top_margin(42)

    assert document.options == %{"--margin-top" => "42"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_top_margin(43)

    assert document.options == %{"--margin-top" => "43"}
  end

  test "adds the right margin of the document to the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_right_margin(42)

    assert document.options == %{"--margin-right" => "42"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_right_margin(43)

    assert document.options == %{"--margin-right" => "43"}
  end

  test "adds the bottom margin of the document to the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_bottom_margin(42)

    assert document.options == %{"--margin-bottom" => "42"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_bottom_margin(43)

    assert document.options == %{"--margin-bottom" => "43"}
  end

  test "adds the left margin of the document to the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_left_margin(42)

    assert document.options == %{"--margin-left" => "42"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_left_margin(43)

    assert document.options == %{"--margin-left" => "43"}
  end

  test "sets the orientation of the document portrait in the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.print_portrait

    assert document.options == %{"--orientation" => "Portrait"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.print_portrait

    assert document.options == %{"--orientation" => "Portrait"}
  end

  test "sets the orientation of the document landscape in the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.print_landscape

    assert document.options == %{"--orientation" => "Landscape"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.print_landscape

    assert document.options == %{"--orientation" => "Landscape"}
  end

  test "can chain document functions in a pipeline" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_html("<h1>Foo Bar</h1>")
    |> HtmlToPdf.print_landscape
    |> HtmlToPdf.set_dpi(700)
    |> HtmlToPdf.set_bottom_margin(50)

    assert document.html == "<h1>Foo Bar</h1>"

    assert document.options == %{
      "--orientation" => "Landscape",
      "--dpi" => "700",
      "--margin-bottom" => "50"}
  end

  test "can generate a new document" do
    {:ok, pdf_document} = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_html("<h1>Foo Bar</h1>")
    |> HtmlToPdf.print_landscape
    |> HtmlToPdf.set_dpi(700)
    |> HtmlToPdf.set_bottom_margin(50)
    |> HtmlToPdf.generate_pdf

    assert pdf_document |> File.exists?
    pdf_document |> File.rm!
  end
end
