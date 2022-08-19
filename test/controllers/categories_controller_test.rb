require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference("Category.count") do
      post categories_url, params: { category: { name: 'categ1', description: 'this is a description' } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { name: 'sample', description: 'sample description' } }
    assert_redirected_to category_url(@category)
  end

  test "should not update category when name is empty" do
    patch category_url(@category), params: { category: { name: '', description: 'sample description' } }
    assert_response :unprocessable_entity
  end

  test "should not update category when name is greater than 20 characters" do
    patch category_url(@category), params: { category: { name: 'This name is greater than 20 characters', description: 'sample description' } }
    assert_response :unprocessable_entity
  end

  test "should not update category when description is empty" do
    patch category_url(@category), params: { category: { name: 'This name is greater than 20 characters', description: '' } }
    assert_response :unprocessable_entity
  end

  test "should not update category when description is less than 10 characters" do
    patch category_url(@category), params: { category: { name: 'This name is greater than 20 characters', description: 'less 10' } }
    assert_response :unprocessable_entity
  end

  test "should not update category when description is more than 100 characters" do
    patch category_url(@category), params: { category: { name: 'This name is greater than 20 characters', description: 'Lorem ipsum keme keme keme 48 years kemerloo jowa matod pamenthol wiz at ang ugmas buya sa krung-krung na shonga tanders majonders keme.' } }
    assert_response :unprocessable_entity
  end

  test "should destroy category" do
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end
    assert_redirected_to categories_url
  end
end
