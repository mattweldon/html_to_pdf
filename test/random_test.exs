defmodule HtmlToPdf.RandomTest do
  use ExUnit.Case

  test "doesn't generate duplicate values over a sensible range of attemps" do
    results = Enum.map(1..20_000, fn(x) -> HtmlToPdf.Random.generate end)
    distinct_results = results |> Enum.dedup

    assert Enum.count(results) == Enum.count(distinct_results)
  end
end
