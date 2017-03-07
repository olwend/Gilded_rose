require_relative '../gilded_rose'

describe GildedRose do

  describe "item" do
    it "has a SellIn value showing number of days till expiry" do
    end

    it "has a Quality value showing a monetary value" do
    end

    it "only has a positive Quality value" do
    end

    it "has a Quality value <= 50" do
    end

    it "has a Sell by date which can be nil" do
    end

    it "has a quality change ratio (x) which can be positve or negative" do
    end
  end

  describe "update_Quality_method" do
    it "lowers item SellIn value and Quality value daily" do
    end

    it "lowers value by x when today < sell by date" do
    end

    it "lowers value by 2x when today > sell by date" do
    end

    it "uses different x values (change ratio) per item" do
    end
  end

  describe "Backstage passes item" do
    it "increases Quality value by 2 when sell by date - today is <= 10" do
    end

    it "increases Quality value by 3 when sell by date - today is <= 5" do
    end

    it "has a Quality value = 0 after concert" do
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
      expect(items[0].name).to eq "fixme"
    end

    it ""
  end

end
