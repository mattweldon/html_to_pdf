defmodule HtmlToPdf.TempFileTest do
  use ExUnit.Case

  test "creates a new file with a randomized filename, containing the contents given" do
    {:ok, new_file} = HtmlToPdf.TempFile.write(:html, "test")
    assert new_file |> File.exists?
    new_file |> File.rm!
  end

end
