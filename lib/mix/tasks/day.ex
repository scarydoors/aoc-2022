defmodule Mix.Tasks.Day do
  use Mix.Task

  def module_day(day) when not is_nil(day) do
    String.to_atom("Elixir.Day#{day}")
  end

  @spec run([x]) :: [x] when x: String.t()
  def run([x]) do
    with x <- Integer.parse(x),
         {day, _} <- x do
      case Code.ensure_compiled(module_day(day)) do
	{:module, module} ->
          if(function_exported?(module, :run, 0)) do
            module.run()
          else
            IO.puts("Module `#{inspect(module)}` does not contain function `run/0`")
          end
	{:error, _} -> IO.puts("There isn't any #{inspect(module_day(day))} module yet!")
      end
    else
      _ ->
        IO.puts("`#{x}` is not a number! Please enter a valid number that corresponds to an AOC2022 day.")
    end
    
  end
end
