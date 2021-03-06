Given /^I have a collection not divisible by 3$/ do
  @collection = (1..10).to_a
end

When /^I apply the column sort method to it for a 3 column layout$/ do 
  @collection = @collection.column_sort(3)
end

Then /^the collection should now be divisible by 3$/ do
  (@collection.length % 3).should == 0
end

Then /^it should be sorted into 3 columns$/ do
  @collection.should == [1, 5, 9, 2, 6, 10, 3, 7, nil, 4, 8, nil]
end
