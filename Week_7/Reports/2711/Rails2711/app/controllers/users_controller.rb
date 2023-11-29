# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  include Pagy::Backend
  def index
    if params[:q].present?
      q_param = params.require(:q).permit(:id_cont, :age_cont, :email_cont, :created_at_cont, :updated_at_cont, :s,
                                          :updated_at_gt, :updated_at_lt, :name_cont, :age_or_email_cont)
      @q = User.ransack(q_param)
    else
      @q = User.ransack # Or adjust this line as needed based on your search requirements
    end
    @pagy, @users = pagy(@q.result(distinct: true), items: 10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # UserMailer.welcome_email(@user).deliver_now
        format.html { redirect_to(@user, notice: 'User was successfully created.', status: :created) }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' , status: :unprocessable_entity}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
        format.html { redirect_to users_path }
    end
  end

  def edit; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :email, :picture, :action, :commit,
                                  products_attributes: %i[title id _destroy])
  end
end
