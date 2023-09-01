defmodule GildedRoseTest do
  @moduledoc """
  Tests for Gilded Rose kata
  """
  use ExUnit.Case
  doctest GildedRose

  # "Aged Brie"
  # Backstage passes to a TAFKAL80ETC concert
  # Sulfuras, Hand of Ragnaros
  # Normal Item

  # NORMAL ITEM
  test "update quality with a single normal item before sell date" do
    item = %Item{name: "NORMAL ITEM", sell_in: 5, quality: 10}

    [%Item{name: "NORMAL ITEM", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 9 == quality
    assert 4 == sell_in
  end

  test "update quality with a single normal item on sell date" do
    item = %Item{name: "NORMAL ITEM", sell_in: 0, quality: 10}

    [%Item{name: "NORMAL ITEM", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 8 == quality
    assert -1 == sell_in
  end

  test "update quality with a single normal item after sell date" do
    item = %Item{name: "NORMAL ITEM", sell_in: -10, quality: 10}

    [%Item{name: "NORMAL ITEM", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 8 == quality
    assert -11 == sell_in
  end

  test "update quality with a single normal item of zero quality" do
    item = %Item{name: "NORMAL ITEM", sell_in: 5, quality: 0}

    [%Item{name: "NORMAL ITEM", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 0 == quality
    assert 4 == sell_in
  end

  # Aged Brie
  test "update quality with a single aged brie item before sell date" do
    item = %Item{name: "Aged Brie", sell_in: 5, quality: 10}

    [%Item{name: "Aged Brie", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 11 == quality
    assert 4 == sell_in
  end

  test "update quality with a single aged brie item before sell date with max quality" do
    item = %Item{name: "Aged Brie", sell_in: 5, quality: 50}

    [%Item{name: "Aged Brie", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 50 == quality
    assert 4 == sell_in
  end

  test "update quality with a single aged brie item before on sell date" do
    item = %Item{name: "Aged Brie", sell_in: 0, quality: 10}

    [%Item{name: "Aged Brie", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 12 == quality
    assert -1 == sell_in
  end

  test "update quality with a single aged brie item before on sell date near max quality" do
    item = %Item{name: "Aged Brie", sell_in: 0, quality: 49}

    [%Item{name: "Aged Brie", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 50 == quality
    assert -1 == sell_in
  end

  test "update quality with a single aged brie item before on sell date with max quality" do
    item = %Item{name: "Aged Brie", sell_in: 0, quality: 50}

    [%Item{name: "Aged Brie", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 50 == quality
    assert -1 == sell_in
  end

  test "update quality with a single aged brie item after sell date" do
    item = %Item{name: "Aged Brie", sell_in: -10, quality: 10}

    [%Item{name: "Aged Brie", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 12 == quality
    assert -11 == sell_in
  end

  test "update quality with a single aged brie item after sell date with max quality" do
    item = %Item{name: "Aged Brie", sell_in: -10, quality: 50}

    [%Item{name: "Aged Brie", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 50 == quality
    assert -11 == sell_in
  end

  # Sulfuras
  test "update quality with a single Sulfuras item before sell date" do
    item = %Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 5, quality: 80}

    [%Item{name: "Sulfuras, Hand of Ragnaros", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 80 == quality
    assert 5 == sell_in
  end

  test "update quality with a single Sulfuras item on sell date" do
    item = %Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 5, quality: 80}

    [%Item{name: "Sulfuras, Hand of Ragnaros", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 80 == quality
    assert 5 == sell_in
  end

  test "update quality with a single Sulfuras item after sell date" do
    item = %Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 5, quality: 80}

    [%Item{name: "Sulfuras, Hand of Ragnaros", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 80 == quality
    assert 5 == sell_in
  end

  # Backstage passes to a TAFKAL80ETC concert
  test "update quality with a single backstage Pass item long before sell date" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 11, quality: 10}

    [%Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 11 == quality
    assert 10 == sell_in
  end

  test "update quality with a single backstage Pass item medium close to sell date (upper bound)" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 10}

    [%Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 12 == quality
    assert 9 == sell_in
  end

  test "update quality with a single backstage Pass item medium close to sell date (upper bound) at max quality" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 50}

    [%Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 50 == quality
    assert 9 == sell_in
  end

  test "update quality with a single backstage Pass item medium close to sell date (lower bound)" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 6, quality: 10}

    [%Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 12 == quality
    assert 5 == sell_in
  end

  test "update quality with a single backstage Pass item medium close to sell date (lower bound) at max quality" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 6, quality: 50}

    [%Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 50 == quality
    assert 5 == sell_in
  end

  test "update quality with a single backstage Pass item very close to sell date (upper bound)" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 10}

    [%Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 13 == quality
    assert 4 == sell_in
  end

  test "update quality with a single backstage Pass item very close to sell date (upper bound) at max quality" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 50}

    [%Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 50 == quality
    assert 4 == sell_in
  end

  test "update quality with a single backstage Pass item very close to sell date (lower bound)" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 1, quality: 10}

    [%Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 13 == quality
    assert 0 == sell_in
  end

  test "update quality with a single backstage Pass item very close to sell date (lower bound) at max quality" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 1, quality: 50}

    [%Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 50 == quality
    assert 0 == sell_in
  end

  test "update quality with a single backstage Pass item very on sell date" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 0, quality: 10}

    [%Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 0 == quality
    assert -1 == sell_in
  end

  test "update quality with a single backstage Pass item very after sell date" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: -10, quality: 10}

    [%Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality, sell_in: sell_in}] =
      GildedRose.update_quality([item])

    assert 0 == quality
    assert -11 == sell_in
  end
end
