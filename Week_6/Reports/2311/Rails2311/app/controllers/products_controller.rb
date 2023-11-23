# frozen_string_literal: true

class ProductsController < ApplicationController
  # GET /users or /users.json
  def index
    @products = Product.where(user_id: params[:user_id])
  end

  # GET /users/1 or /users/1.json
  def show
    @products = Product.find_by(user_id: params[:user_id], id: params[:id])
  end

  # GET /users/new
  def new
    @user = User.find(params[:user_id])
    @product = @user.products.build
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @product = Product.new(product_params)
    @product.user_id = params[:user_id]
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to user_products_path(@product.user_id), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update; end

  # DELETE /users/1 or /users/1.json
  def destroy
    @product = Product.find_by(user_id: params[:user_id], id: params[:id])
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :user_id)
  end
end
