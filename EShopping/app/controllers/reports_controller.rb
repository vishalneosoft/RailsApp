class ReportsController < ApplicationController
  def sales_report
    @order = Order.month
  end

  def customer_register
  end

  def coupon_used
  end
end
