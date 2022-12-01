defmodule Day1 do
  import Aoc2022
  def run do
    {:ok, data} = read_input('day1pt1')
    

    data1 = data
    |> String.split("\n")
    |> Enum.chunk_by(fn x -> x != "" end)
    |> Enum.map(fn x ->
      Enum.map(x, fn y -> case Integer.parse(y) do
	  {n, _} when is_number(n) -> n
          :error -> 0
        end
      end)
    end)
    |> Enum.map(fn x -> Enum.sum(x) end)
    |> Enum.sort(&(&1 >= &2))
    |> Enum.take(1)
    |> Enum.sum
    
    IO.puts(inspect(data1))


    IO.puts("day 1 part 2")



    data2 = data
    |> String.split("\n")
    |> Enum.chunk_by(fn x -> x != "" end)
    |> Enum.map(fn x ->
      Enum.map(x, fn y -> case Integer.parse(y) do
	  {n, _} when is_number(n) -> n
          :error -> 0
        end
      end)
    end)
    |> Enum.map(fn x -> Enum.sum(x) end)
    |> Enum.sort(&(&1 >= &2))
    |> Enum.take(3)
    |> Enum.sum
    
    IO.puts(inspect(data2))

  end
end
