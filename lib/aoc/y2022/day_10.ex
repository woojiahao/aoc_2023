defmodule AOC.Y2022.Day10 do
  @moduledoc false

  use AOC.Solution
  import Utils.General, [:map_sum]

  @target_cycles [20, 60, 100, 140, 180, 220]

  @impl true
  def load_data() do
    Data.load_day(2022, 10)
    |> Enum.reduce([1], fn
      "addx " <> v, [p | _] = acc -> [p + String.to_integer(v), p] ++ acc
      "noop", [p | _] = acc -> [p] ++ acc
    end)
    |> Enum.reverse()
  end

  @impl true
  def part_one(data), do: map_sum(@target_cycles, fn cycle -> cycle * get_cycle(data, cycle) end)

  @impl true
  def part_two(data), do: draw_crt(data)

  defp get_cycle(data, cycle), do: Enum.at(data, cycle - 1)

  defp draw_crt(data),
    do: draw(data, 1, []) |> Enum.map_join("\n", fn row -> Enum.join(row, "") end)

  defp draw(_data, 241, crt), do: Enum.reverse(crt)

  defp draw(data, cycle, crt) when length(crt) == div(cycle - 1, 40),
    do: draw(data, cycle, [[] | crt])

  defp draw(data, cycle, [row | rest]) do
    strength = get_cycle(data, cycle)
    crt_pixel_idx = rem(cycle - 1, 40) + 1
    crt_pixel = if crt_pixel_idx in strength..(strength + 2), do: "#", else: "."
    draw(data, cycle + 1, [row ++ [crt_pixel] | rest])
  end
end
