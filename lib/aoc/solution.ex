defmodule AOC.Solution do
  @moduledoc false

  @callback load_data() :: any()
  @callback part_one(data :: any()) :: any()
  @callback part_two(data :: any()) :: any()

  defmacro __using__(_opts) do
    quote do
      alias Utils.{Array, Data, General, Geometry, Matrix, Math, Set}
      alias Utils.String, as: AOCString

      @behaviour AOC.Solution

      def solve_one() do
        load_data()
        |> part_one()
      end

      def solve_two() do
        load_data()
        |> part_two()
      end
    end
  end
end
