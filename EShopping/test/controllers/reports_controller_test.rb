require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get sales_report" do
    get :sales_report
    assert_response :success
  end

  test "should get customer_register" do
    get :customer_register
    assert_response :success
  end

  test "should get coupon_used" do
    get :coupon_used
    assert_response :success
  end

end
