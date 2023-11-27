# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  include Pagy::Backend
  def index
    # search_params = params[:user_list]&.fetch(:test, nil)
    # @pagy, @users = pagy(User.all, items: 1)
    # @users = User.search_with_name(search_params)
    search_params = params[:user_list]&.fetch(:test, nil)
    @pagy, @users = pagy(User.search_with_name(search_params), items: 1)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path }
      else
        format.htmll { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to users_path }
      else
        format.html { render :index }
      end
    end
  end

  def edit; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, products_attributes: %i[title id _destroy])
  end
end
