defmodule HtmlToPdf.Wkhtmltopdf do

  def execute(html_file, pdf_file) do
    if program = System.find_executable("wkhtmltopdf") do
      case System.cmd(program, ["--encoding", "utf-8", html_file, pdf_file]) do
        {_, 0} ->
          {:ok, pdf_file}
        result ->
          {:error, "An error occurred generating the PDF file #{pdf_file}."}
      end
    else
      {:error, "Unable to find the wkhtmltopdf executable in the system path."}
    end
  end

end
