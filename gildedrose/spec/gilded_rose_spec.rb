require_relative '../gilded_rose'

describe GildedRose do
  
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()

      expect(items[0].name).to eq "foo"
    end
  end

  describe "item" do

    it "has a positive sell_in value showing number of days to sell by date" do
    end

    it "has a negative sell_in value showing number of days over sell by date" do
    end

    it "only has a positive quality value" do
    end

    it "has a quality value <= 80" do
    end

    it "has a quality change amount (x) which can be positve or negative" do
    end
  end

  describe "Sulfuras legendary item" do
    it "has a sell_in date of nil so never decreases in quality" do
    end
    it "has a quality value of 80" do
    end
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
    it "lowers value by 2 when sell_in > 0" do
    end
    it "lowers value by 4 when sell_in < 0" do
    end
  end


end
