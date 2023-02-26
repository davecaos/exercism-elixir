defmodule KitchenCalculator do
  def get_volume({_unit, volume}) do
    volume
  end

  def to_milliliter({:milliliter, _volume} = volume_pair), do: volume_pair
  def to_milliliter({:cup , volume}), do: {:milliliter,240 *volume }
  def to_milliliter({:fluid_ounce , volume}), do: {:milliliter, 30 *volume }
  def to_milliliter({:teaspoon , volume}), do: {:milliliter, 5 *volume }
  def to_milliliter({:tablespoon , volume}), do: {:milliliter, 15 *volume }

  def from_milliliter({:milliliter, volume}, :cup), do: {:cup, volume/240}
  def from_milliliter({:milliliter, volume}, :fluid_ounce), do: {:fluid_ounce, volume / 30}
  def from_milliliter({:milliliter, volume}, :teaspoon), do: {:teaspoon, volume / 5}
  def from_milliliter({:milliliter, volume}, :tablespoon), do: {:tablespoon, volume / 15}
  def from_milliliter({:milliliter, _volume} = volume_pair, :milliliter), do: volume_pair

  def convert(volume_pair, unit) do
    volume_in_milliliter = to_milliliter(volume_pair)
    from_milliliter(volume_in_milliliter, unit)
  end
end
