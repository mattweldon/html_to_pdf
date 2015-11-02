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

  test "adds the left-aligned footer text of the document to the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_left_footer_text("foo")

    assert document.options == %{"--footer-left" => "foo"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_left_footer_text("bar")

    assert document.options == %{"--footer-left" => "bar"}
  end

  test "adds the right-aligned footer text of the document to the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_right_footer_text("foo")

    assert document.options == %{"--footer-right" => "foo"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_right_footer_text("bar")

    assert document.options == %{"--footer-right" => "bar"}
  end

  test "adds the center-aligned footer text of the document to the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_center_footer_text("foo")

    assert document.options == %{"--footer-center" => "foo"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_center_footer_text("bar")

    assert document.options == %{"--footer-center" => "bar"}
  end

  test "adds footer text / font settings of the document to the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_footer_font(family: "Georgia", size: 10)

    assert document.options == %{"--footer-font-name" => "Georgia", "--footer-font-size" => "10"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_footer_font(family: "Times New Roman", size: 14)

    assert document.options == %{"--footer-font-name" => "Times New Roman", "--footer-font-size" => "14"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_footer_font(family: "Georgia")

    assert document.options == %{"--footer-font-name" => "Georgia"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_footer_font(size: 9)

    assert document.options == %{"--footer-font-size" => "9"}
  end

  test "adds the footer spacing of the document to the options map" do
    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_footer_spacing(10)

    assert document.options == %{"--footer-spacing" => "10"}

    document = %HtmlToPdf.Document{}
    |> HtmlToPdf.set_footer_spacing(12)

    assert document.options == %{"--footer-spacing" => "12"}
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
