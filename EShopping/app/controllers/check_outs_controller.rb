class CheckOutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_check_out, only: [:show, :edit, :update, :destroy]

  # GET /check_outs
  # GET /check_outs.json
  def index
    @check_outs = CheckOut.all
    @cart_items = current_user.cart_items
    @cart_total = 0
    @cart_items.each do |item|
      @cart_total += item.quantity * item.product.price
    end
    if @cart_total > 5000
      @shipping_cost = 100.to_f
    else
      @shipping_cost = 0.to_f
    end
    @addresses = current_user.addresses
    @address = Address.new
  end

  # GET /check_outs/1
  # GET /check_outs/1.json
  def show
  end

  # GET /check_outs/new
  def new
    @check_out = CheckOut.new
  end

  # GET /check_outs/1/edit
  def edit
  end

  # POST /check_outs
  # POST /check_outs.json
  def create
    @check_out = CheckOut.new(check_out_params)

    respond_to do |format|
      if @check_out.save
        format.html { redirect_to @check_out, notice: 'Check out was successfully created.' }
        format.json { render :show, status: :created, location: @check_out }
      else
        format.html { render :new }
        format.json { render json: @check_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_outs/1
  # PATCH/PUT /check_outs/1.json
  def update
    respond_to do |format|
      if @check_out.update(check_out_params)
        format.html { redirect_to @check_out, notice: 'Check out was successfully updated.' }
        format.json { render :show, status: :ok, location: @check_out }
      else
        format.html { render :edit }
        format.json { render json: @check_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_outs/1
  # DELETE /check_outs/1.json
  def destroy
    @check_out.destroy
    respond_to do |format|
      format.html { redirect_to check_outs_url, notice: 'Check out was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def review_payment
    @cart_items = current_user.cart_items
    @cart_total = 0
    @cart_items.each do |item|
      @cart_total += item.quantity * item.product.price
    end
    if @cart_total > 5000
      @shipping_cost = 100.to_f
    else
      @shipping_cost = 0.to_f
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_out
      @check_out = CheckOut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_out_params
      params.fetch(:check_out, {})
    end
end