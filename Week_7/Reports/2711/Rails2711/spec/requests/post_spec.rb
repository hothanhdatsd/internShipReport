# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'displays a list of posts' do
      get '/posts'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /posts' do
    it 'displays a list of posts' do
      get '/posts/new'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /posts/:id' do
    it 'displays a single post' do
      post = FactoryBot.create(:post) # Assuming you have a Post factory
      get "/posts/#{post.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /posts' do
    it 'creates a new post with valid attributes' do
      valid_attributes = { title: 'New Post', content: 'Content for the new post' }
      post '/posts', params: { post: valid_attributes }
      expect(response).to have_http_status(302)
      expect(Post.last.title).to eq('New Post')
    end

    it 'does not create a post with invalid attributes' do
      invalid_attributes = { title: '', content: 'Content for the new post' }
      post '/posts', params: { post: invalid_attributes }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Post.count).to eq(0)
    end
  end

  describe 'PATCH /posts/:id' do
    it 'updates a post with valid attributes' do
      post = FactoryBot.create(:post)
      updated_attributes = { title: 'Updated Title', content: 'Updated content' }
      patch "/posts/#{post.id}", params: { post: updated_attributes }
      expect(response).to have_http_status(302)
      expect(post.reload.title).to eq('Updated Title')
    end

    it 'updates a post with valid attributes' do
      post = FactoryBot.create(:post)
      updated_attributes = { title: '', content: '' }
      patch "/posts/#{post.id}", params: { post: updated_attributes }
      expect(response).to have_http_status(422)
    end
  end

  describe 'DELETE /posts/:id' do
    it 'deletes a post' do
      post = FactoryBot.create(:post)
      expect do
        delete "/posts/#{post.id}"
      end.to change(Post, :count).by(-1)
      expect(response).to have_http_status(302)
    end
  end
end
