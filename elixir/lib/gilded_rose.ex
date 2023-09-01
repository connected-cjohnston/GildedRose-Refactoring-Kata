defmodule GildedRose do
  @moduledoc """
  Functions for the Gilded Rose Kata
  """

  @doc """
  Update the quality of an item

  ## Examples

      iex> GildedRose.update_quality([%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 1}])
      [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 8, quality: 3}]

  """
  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  @doc """
  Updates the quality of an item

  ## Examples

      iex> GildedRose.update_item(%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 1})
      %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 8, quality: 3}

  """
  def update_item(%Item{name: "Conjured Mana Cake"} = item) do
    cond do
      item.quality == 0 ->
        %{item | quality: 0, sell_in: item.sell_in - 1}

      item.sell_in > 0 ->
        %{item | quality: item.quality - 2, sell_in: item.sell_in - 1}

      item.sell_in <= 0 ->
        %{item | quality: item.quality - 4, sell_in: item.sell_in - 1}
    end
  end

  def update_item(%Item{name: "Sulfuras, Hand of Ragnaros"} = item) do
    item
  end

  def update_item(%Item{name: "NORMAL ITEM"} = item) do
    cond do
      item.quality == 0 ->
        %{item | quality: 0, sell_in: item.sell_in - 1}

      item.sell_in > 0 ->
        %{item | quality: item.quality - 1, sell_in: item.sell_in - 1}

      item.sell_in <= 0 ->
        %{item | quality: item.quality - 2, sell_in: item.sell_in - 1}
    end
  end

  def update_item(%Item{name: "Aged Brie"} = item) do
    cond do
      item.quality == 50 ->
        %{item | sell_in: item.sell_in - 1}

      item.sell_in > 0 ->
        %{item | quality: item.quality + 1, sell_in: item.sell_in - 1}

      item.sell_in <= 0 && item.quality == 49 ->
        %{item | quality: 50, sell_in: item.sell_in - 1}

      item.sell_in <= 0 ->
        %{item | quality: item.quality + 2, sell_in: item.sell_in - 1}
    end
  end

  def update_item(%Item{name: "Backstage passes to a TAFKAL80ETC concert"} = item) do
    cond do
      item.quality == 50 ->
        %{item | quality: 50, sell_in: item.sell_in - 1}

      item.sell_in > 10 ->
        %{item | quality: item.quality + 1, sell_in: item.sell_in - 1}

      item.sell_in > 5 && item.quality < 49 ->
        %{item | quality: item.quality + 2, sell_in: item.sell_in - 1}

      item.sell_in > 5 && item.quality >= 49 ->
        %{item | quality: 50, sell_in: item.sell_in - 1}

      item.sell_in > 0 && item.quality < 49 ->
        %{item | quality: item.quality + 3, sell_in: item.sell_in - 1}

      item.sell_in > 0 && item.quality >= 49 ->
        %{item | quality: 50, sell_in: item.sell_in - 1}

      item.sell_in <= 0 ->
        %{item | quality: 0, sell_in: item.sell_in - 1}
    end
  end

  def update_item(item) do
    item =
      cond do
        item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" ->
          if item.quality > 0 do
            if item.name != "Sulfuras, Hand of Ragnaros" do
              %{item | quality: item.quality - 1}
            else
              item
            end
          else
            item
          end

        true ->
          cond do
            item.quality < 50 ->
              item = %{item | quality: item.quality + 1}

              cond do
                item.name == "Backstage passes to a TAFKAL80ETC concert" ->
                  item =
                    cond do
                      item.sell_in < 11 ->
                        cond do
                          item.quality < 50 ->
                            %{item | quality: item.quality + 1}

                          true ->
                            item
                        end

                      true ->
                        item
                    end

                  cond do
                    item.sell_in < 6 ->
                      cond do
                        item.quality < 50 ->
                          %{item | quality: item.quality + 1}

                        true ->
                          item
                      end

                    true ->
                      item
                  end

                true ->
                  item
              end

            true ->
              item
          end
      end

    item =
      cond do
        item.name != "Sulfuras, Hand of Ragnaros" ->
          %{item | sell_in: item.sell_in - 1}

        true ->
          item
      end

    cond do
      item.sell_in < 0 ->
        cond do
          item.name != "Aged Brie" ->
            cond do
              item.name != "Backstage passes to a TAFKAL80ETC concert" ->
                cond do
                  item.quality > 0 ->
                    cond do
                      item.name != "Sulfuras, Hand of Ragnaros" ->
                        %{item | quality: item.quality - 1}

                      true ->
                        item
                    end

                  true ->
                    item
                end

              true ->
                %{item | quality: item.quality - item.quality}
            end

          true ->
            cond do
              item.quality < 50 ->
                %{item | quality: item.quality + 1}

              true ->
                item
            end
        end

      true ->
        item
    end
  end
end
