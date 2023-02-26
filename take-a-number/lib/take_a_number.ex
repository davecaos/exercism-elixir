defmodule TakeANumber do

  def loop(state) do
    receive do
      {:report_state, from} ->
        send(from, state)
        loop(state)
      {:take_a_number, from} ->
          new_number = state + 1
          send(from, new_number)
          loop(new_number)
      :stop -> nil
      _else -> loop(state)
    end
  end

  def start() do
    spawn(__MODULE__, :loop, [0])
  end
end
