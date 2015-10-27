defmodule HtmlToPdf.Random do

  def generate do
    << a :: 32, b :: 32, c :: 32 >> = :crypto.rand_bytes(12)
    :random.seed(a,b,c)
    :random.uniform(9999999999)
  end

end
