defmodule HtmlToPdf.Wkhtmltopdf do

  def execute(html_file, pdf_file, options) do
    if program = System.find_executable("wkhtmltopdf") do
      options = options ++ [html_file]
      options = options ++ [pdf_file]
      case System.cmd(program, options) do
        {_, 0} ->
          {:ok, pdf_file}
        result ->
          {:error, "An error occurred generating the PDF file #{pdf_file}. The following results were returned: #{result}"}
      end
    else
      {:error, "Unable to find the wkhtmltopdf executable in the system path."}
    end
  end

end
