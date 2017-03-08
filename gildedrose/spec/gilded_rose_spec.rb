require_relative '../gilded_rose'

describe GildedRose do

  context "#update_quality on defaults" do

    before(:each) do
      @defaults = [Item.new("Dvest", 0, 2),Item.new("DVest", 10, 50),Item.new("EMong", 5, 7),Item.new("EMong", -2, 0)]
      @standard_gr = GildedRose.new(@defaults)
    end

    it "returns message after update_quality method" do
      expect(@standard_gr.update_quality()).to include("update_quality complete")
    end

    it "says it has 4 items" do
      expect(@defaults.size).to eq(4)
    end

    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()

      expect(items[0].name).to eq "foo"
    end

    it "item can have positive sell_in value(number of days to sell by date)" do
    end

    it "item can have negative sell_in value(number of days past sell by date)" do
    end

    it "item quality value does not go below zero" do
    end

    it "item quality value does not go above 50" do
    end

    it "sell_in > 0 update_quality decreases quality value by 1 daily" do
    end

    it "sell_in < 0 update_quality decreases quality value by 2 daily" do
    end
  end


  context "#update_quality on Sulfuras legendary item" do

    it "has a sell_in date of nil so never decreases in quality" do
    end
    it "has a quality value of 80" do
    end
  end

  context "#update_quality on Backstage passes item" do
    it "increases quality value by 2 when sell by date - today is <= 10" do
    end

    it "increases quality value by 3 when sell by date - today is <= 5" do
    end

    it "has a quality value = 0 after concert" do
    end
  end

  context "#update_quality on conjured items" do
    it "lowers value by 2 when sell_in > 0" do
    end
    it "lowers value by 4 when sell_in < 0" do
    end
  end
end
