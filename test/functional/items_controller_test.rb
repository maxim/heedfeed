require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "gets new" do
    get :new
    assert_response :success
  end

  test "creates item" do
    assert_difference('Item.count') do
      post :create, item: @item.attributes
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "shows item" do
    get :show, id: @item.to_param
    assert_response :success
  end

  test "gets edit" do
    get :edit, id: @item.to_param
    assert_response :success
  end

  test "updates item" do
    put :update, id: @item.to_param, item: @item.attributes
    assert_redirected_to item_path(assigns(:item))
  end

  test "destroys item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item.to_param
    end

    assert_redirected_to @item.feed
  end
end
