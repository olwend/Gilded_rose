require_relative '../gilded_rose'

describe GildedRose do

  context "#update_quality on defaults" do

    before(:each) do
      @defaults = [Item.new("Dvest", 0, 5),Item.new("DVest", 10, 51),Item.new("EMong", -1, 7),Item.new("EMong", -2, 0)]
      @standard_gr = GildedRose.new(@defaults)
    end

    it "does not change the name" do
      start_name = @defaults[0].name
      @standard_gr.update_quality
      expect(@defaults[0].name).to eq(start_name)
    end

    it "defaults has 4 items" do
      expect(@defaults.size).to eq(4)
    end

    it "item can have positive sell_in value(number of days to sell by date)" do
      expect(@defaults[1].sell_in).to eq(10)
    end

    it "item can have negative sell_in value(number of days past sell by date)" do
      expect(@defaults[3].sell_in).to eq(-2)
    end

    it "item sell_in reduces by 1 daily" do
      @standard_gr.update_quality
      expect(@defaults[3].sell_in).to eq(-3)
    end

    it "item quality value does not go below zero" do
      @standard_gr.update_quality
      expect(@defaults[3].quality).to eq(0)
    end

    it "item quality value cannot be assigned over 50" do
      expect(@defaults[1].quality).to eq(50)
    end

    it "item quality value decreases by 1 daily" do
      @standard_gr.update_quality
      expect(@defaults[1].quality).to eq(50)
    end

    it "sell_in > 0 update_quality decreases quality value by 1 daily" do
      @standard_gr.update_quality
      expect(@defaults[0].quality).to eq(3)
    end

    it "sell_in = 0 update_quality decreases quality value by 2 daily" do
      @standard_gr.update_quality
      expect(@defaults[0].quality).to eq(3)
    end

    it "sell_in < 0 update_quality decreases quality value by 2 daily" do
      @standard_gr.update_quality
      expect(@defaults[2].quality).to eq(5)
    end
  end


  context "#update_quality on Sulfuras legendary item" do

    before(:each) do
      @sulf = [Item.new("Sulfuras, Hand of Ragnaros", 1, 50),Item.new("Sulfuras, Hand of Ragnaros", 10, 51),Item.new("Sulfuras, Hand of Ragnaros", - 20, 80)]
      @standard_gr = GildedRose.new(@sulf)
    end
    it "never decreases quality with different sell_in values" do
      @standard_gr.update_quality
      expect(@sulf[0].quality).to eq(50)
      expect(@sulf[1].quality).to eq(51)
      expect(@sulf[2].quality).to eq(80)
    end
    it "can hold quality 80 even if default max = 50" do
      @standard_gr.update_quality
      expect(@sulf[2].quality).to eq(80)
    end
  end

  context "#update_quality on Backstage passes item" do
    before(:each) do
      @backstage = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50),Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 51),
        Item.new("Backstage passes to a TAFKAL80ETC concert",-1, 2),Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 0),
        Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 3),Item.new("Backstage passes to a TAFKAL80ETC concert", - 9, 0)]
      @backstage2 = [Item.new("Backstage passes to a FATKAL80ETC concert", 9, 50)]
      @standard_gr = GildedRose.new(@backstage)
      @standard_gr2 = GildedRose.new(@backstage2)
    end
    it "TAFKAL80ETC concert quality + 2 when sell_in is <= 10" do
      @standard_gr.update_quality
      expect(@backstage[0].quality).to eq(52)
      expect(@backstage[3].quality).to eq(52)
    end

    it "TAFKAL80ETC concert quality + 3 when sell_in is <= 5" do
      @standard_gr.update_quality
      expect(@backstage[1].quality).to eq(54)
      expect(@backstage[4].quality).to eq(3)
    end

    it "TAFKAL80ETC concert quality = 0 after concert when sell_in = -1" do
      @standard_gr.update_quality
      expect(@backstage[2].quality).to eq(0)
      expect(@backstage[5].quality).to eq(0)
    end

    it "runs logic for concert with different name FATKAL80ETC concert" do
      @standard_gr2.update_quality
      expect(@backstage2[0].quality).to eq(52)
    end
  end

  context "#update_quality on conjured items" do
    before(:each) do
      @conjure = [Item.new("Conjured Mana Cake", 1, 10),Item.new("Conjured Mana Cake", 0, 10),Item.new("Conjured Mana Cake", -1, 12)]
      @standard_gr = GildedRose.new(@conjure)
    end
    it "lowers value by 2 when sell_in > 0" do
      @conjure.update_quality
      expect(@conjure[0].quality).to eq(8)
    end
    it "lowers value by 2 when sell_in = 0" do
      @conjure.update_quality
      expect(@conjure[1].quality).to eq(8)
    end
    it "lowers value by 4 when sell_in < 0" do
      @conjure.update_quality
      expect(@conjure[2].quality).to eq(8)
    end
  end
end
