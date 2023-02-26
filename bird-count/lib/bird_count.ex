defmodule BirdCount do

  def today([]) do
    nil
  end

  def today(list) do
    [today | _rest_of_the_days] = list
    today
  end

  def increment_day_count([]) do
    [1]
  end
  def increment_day_count(list) do
    [today | rest_of_the_days] = list
    [today + 1 | rest_of_the_days]
  end

  def has_day_without_birds?(list) do
    Enum.any?(list, fn(bird_count)-> bird_count == 0 end)
  end

  def total(list) do
    Enum.reduce(list, 0, &+/2)
  end

  def busy_days(list) do
    Enum.reduce(list, 0,
      fn(bird_count, acc)->
        cond do
          bird_count >= 5 -> (acc + 1)
          true -> acc
        end
      end)
  end
end
