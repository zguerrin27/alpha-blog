require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")    #creates an instance variable for our test
  end

  test "should get categories index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)     #pass in whole @category object
    assert_response :success
  end

end