# HtmlToPdf

Super simple way to generate a PDF from HTML in Elixir.

At its core, HtmlToPdf wraps the WkHtmlToPdf executable with a couple of simple helper methods.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add html_to_pdf to your list of dependencies in `mix.exs`:

        def deps do
          [{:html_to_pdf, "~> 0.0.1"}]
        end

  2. Ensure html_to_pdf is started before your application:

        def application do
          [applications: [:html_to_pdf]]
        end

## Installing WKHTMLTOPDF on Ubuntu 14.04

```
wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
sudo dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
```
