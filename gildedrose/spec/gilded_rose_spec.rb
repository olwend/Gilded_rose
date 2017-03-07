require_relative '../gilded_rose'

describe GildedRose do

  describe "item" do

    it "has a sell_in value showing number of days till expiry" do
    end

    it "has a quality value" do
    end

    it "only has a positive quality value" do
    end

    it "has a quality value <= 50" do
    end

    it "when sell_in value is zero, it has reached sell_by_date" do
    end

    it "has a quality change ratio (x) which can be positve or negative" do
    end
  end

  describe "Sulfuras legendary item" do
    it "has a sell_in date of nil so never decreases in quality" do
    end
    it "has a quality value of 80" do
    end

  describe "Backstage passes item" do
    it "increases quality value by 2 when sell by date - today is <= 10" do
    end

    it "increases quality value by 3 when sell by date - today is <= 5" do
    end

    it "has a quality value = 0 after concert" do
    end
  end

  describe "conjured items" do
    it "lowers value by 2x when today < sell by date" do
    end
    it "lowers value by 4x when today > sell by date" do
    end
  end

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()

      expect(items[0].name).to eq "foo"
    end

    it "lowers item sell_in and quality daily" do
    end

    it "lowers value by x when today < sell by date" do
    end

    it "lowers value by 2x when today > sell by date" do
    end

    it "uses different x values (change ratio) per item" do
    end
  end
end
