# Gilded_rose
Tech test Tues/Weds

The aim is to practice good design, by a refactor of Ruby code in such a way that adding the new "conjured"  
functionality is easy.
The text based approval test is baseline to ensure that changes do not break existing behaviour.
I have completed my rspec test framework, giving 95% coverage of legacy code.
```rspec
Coverage report generated for RSpec to /Users/DOE/Projects/Makers_Course/week10/gildedrose/coverage. 146 / 153 LOC (95.42%) covered.
```
Next step is to write new code to pass the rspec tests.

Kata text:
----------
*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a   
friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly   
degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us.   
It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature  
to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item.  
All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both   
values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches;  
- Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
- We have recently signed a supplier of conjured items. This requires an update to our system:
“Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."

Approach
--------
![Object model](https://github.com/olwend/Gilded_rose/tree/master/gildedrose/gilded_rose.jpg)

To see the logic work, run ```$ ruby texttest_fixture.rb```  
I added boundary test cases, to cover missing scenarios:  
- Backstage passes quality increases by 2 sell_in <=10, by 3 sell_in <=5, quality drops to 0 after concert  
- Backstage passes have a MAX of 50  
- default behaviour is shown by '+5 Dexterity Vest' for sell_in >0 and <=0  
- conjured items added cases to check double quality decrease for sell_in >0 and <=0  

This test file results in 2 exceptions to expected behaviour:  
 - 'Sulfuras, Hand of Ragnaros' quality = 80  
 - conjured items do not decrease in value at double rate  
 - Backstage passes quality increase bug on days 5 & 10

https://github.com/olwend/Gilded_rose/issues/1   
Issue raised to cover legacy bugs fixed (assumption that Sulfurus quality = 80 is a confirmed exception to quality max = 50).  

Expected results post extension to add conjured:  
(Expected change: item.quality = item.quality - 2, item.quality = item.quality - 4	sell_in < 0)
Conjured Mana Cake, 2, 4
Conjured Mana Cake, 0, 4

The text based approval test is baseline to ensure that changes do not break existing behaviour.
