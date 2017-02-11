require 'test_helper'

class WishListsControllerTest < ActionController::TestCase
  setup do
    @wish_list = wish_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wish_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wish_list" do
    assert_difference('WishList.count') do
      post :create, wish_list: { product_id: @wish_list.product_id, quantity: @wish_list.quantity, user_id: @wish_list.user_id }
    end

    assert_redirected_to wish_list_path(assigns(:wish_list))
  end

  test "should show wish_list" do
    get :show, id: @wish_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wish_list
    assert_response :success
  end

  test "should update wish_list" do
    patch :update, id: @wish_list, wish_list: { product_id: @wish_list.product_id, quantity: @wish_list.quantity, user_id: @wish_list.user_id }
    assert_redirected_to wish_list_path(assigns(:wish_list))
  end

  test "should destroy wish_list" do
    assert_difference('WishList.count', -1) do
      delete :destroy, id: @wish_list
    end

    assert_redirected_to wish_lists_path
  end
end
