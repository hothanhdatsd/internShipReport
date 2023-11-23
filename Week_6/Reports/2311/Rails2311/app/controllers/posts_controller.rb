# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  def index
    @post = Post.find_by(user_id: params[:user_id])
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_products_url(@post.user_id), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to user_url(@post.user_id) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id], user_id: params[:user_id])
    @post.destroy
  end

  private

  def set_post
    @post = Post.find_by(user_id: params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title)
  end
end
