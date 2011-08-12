require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  setup do
    @feed = feeds(:one)
  end

  test "gets new" do
    get :new
    assert_response :success
  end

  test "creates feed" do
    assert_difference('Feed.count') do
      post :create, feed: @feed.attributes
    end

    assert_redirected_to feed_path(assigns(:feed))
  end

  test "shows feed" do
    get :show, id: @feed.to_param
    assert_response :success
  end

  test "gets edit" do
    get :edit, id: @feed.to_param
    assert_response :success
  end

  test "updates feed" do
    put :update, id: @feed.to_param, feed: @feed.attributes
    assert_redirected_to feed_path(assigns(:feed))
  end

  test "destroys feed" do
    assert_difference('Feed.count', -1) do
      delete :destroy, id: @feed.to_param
    end

    assert_redirected_to feeds_path
  end
end
