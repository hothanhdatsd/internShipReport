# frozen_string_literal: true

# product controller
class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  def index
    @product = Product.find_by(user_id: params[:user_id])
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to user_products_url, notice: 'Product updated' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to user_url, notice: 'Product deleted' }
    end
  end

  private

  def set_product
    @product = Product.find_by(user_id: params[:user_id])
  end

  def product_params
    params.require(:product).permit(:title, :user_id)
  end
end
