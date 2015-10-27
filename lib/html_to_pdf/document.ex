defmodule HtmlToPdf.Document do
  defstruct html: "", pdf: "", options: %{}

  def put_option(document, opt_key, opt_value) do
    %{options: options} = document

    %{document | options: options |> Dict.put(opt_key, opt_value)}
  end
end
