Feature: Column Sort
  As a designer
  I want to sort a collection in such a way 
  So that when I display it with a liquid layout, it comes out sorted in columns, not rows
  
  Scenario: Sorting for a 3 column liquid layout
    Given I have a collection not divisible by "3"
    When I apply the column sort method to it for a "3" column layout
    Then the collection should now be divisible by "3"
    And it should be sorted into columns
