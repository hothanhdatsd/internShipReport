# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  include Pagy::Backend
  def index
    if params[:q].present?
      q_param = params.require(:q).permit(:test_cont, :rich_text_name_cont)
      @q = User.ransack(q_param)
      @pagy, @users = pagy(@q.result(distinct: true), items: 5)
    else
      @q = User.ransack(q_param)
      @pagy, @users = pagy(User.all, items: 5)
    end
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
        UserMailer.welcome_email(@user).deliver_now
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
    params.require(:user).permit(:name, :age, :email, products_attributes: %i[title id _destroy])
  end
end
