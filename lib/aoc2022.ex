defmodule Aoc2022 do
  def read_input(filename) do
    Path.expand(filename, "data")
    |> File.read()
  end
end
