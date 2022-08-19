require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should not save Category" do
    category = Category.new
    category.name = "Yellow"
    category.description = 'This is a description of the category.'
    assert category.save, "Saved the Category without instantiation"
  end

  test "should not save Category with empty name" do
    category = Category.new
    category.description = 'This is a description of the category.'
    assert_not category.save, "Saved the Category without a name"
  end

  test "should not save a category with name longer than 20 characters" do
    category = Category.new
    category.name = 'This is a name of a category that has more than 20 characters.'
    assert_not category.save, "Saved the Category with name more than 20 characters"
  end
  
  test "should not save category with duplicate name" do
    category1 = Category.new
    category2 = Category.new

    category1.name = 'Category1'
    category1.description = 'Description for category1'
    category1.save

    category2.name = 'Category1'
    category2.description = 'Description for category2'

    assert_not category2.save, "Saved Category with duplicate name"

  end

  test "should not save category with empty description" do
    category = Category.new
    category.name = 'Category'
    assert_not category.save, "Saved the Category with empty description"
  end

  test "should not save category with description less than 10 characters" do
    category = Category.new
    category.name = 'Category'
    category.description = 'c'
    assert_not category.save, "Saved the Category with description less than 10 characters"
  end

  test "should not save category with description more than 100 characters" do
    category = Category.new
    category.name = 'Category'
    category.description = 'Lorem ipsum keme keme keme 48 years pamenthol jowabella ng shontis nang jongoloids oblation na ang pranella.'
  end
end
