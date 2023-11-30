# require 'rails_helper'

# RSpec.describe UsersController, type: :controller do
#   describe "GET #users" do
#     it "returns a successful response" do
#       get '/users'
#       expect(response).to have_http_status(200)
#     end
#   end
#   describe "GET #users for condition" do
#     it "returns a successful response" do
#       user = create(:user)
#       get "/users", params: { q: { age_or_email_cont: user.age } }
#       expect(response).to have_http_status(200)
#       expect(assigns(:users)).to include(user)
#     end
#   end
#   describe 'GET #user' do
#     it 'returns a success response' do
#       user = create(:user)
#       get "/users/#{user.id}"
#       expect(response).to have_http_status(200)
#       expect(assigns(:user)).to eq(user)
#     end
#   end

#   describe 'POST #create' do
#     it "create a new user" do
#       user = attributes_for(:user)
#       post '/users', params: { user: user }
#       expect(response).to have_http_status(302)
#       expect(User.last.email).to eq(user[:email])
#     end

#     it "POST #users new user failed" do
#       userInValid = attributes_for(:user, email: '')
#       post '/users', params: { user: userInValid }
#       expect(response).to have_http_status(:unprocessable_entity)
#     end
#   end
  
#   describe "GET #new user" do 
#     it "create a new user" do
#       user = create(:user)
#       get '/users/new'
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe 'POST #destroy' do
#     it "destroy a user" do 
#       user = create(:user)
#       delete "/users/#{user.id}"
#       expect(response).to redirect_to(users_path)
#     end
#   end

#   describe "PUT #update user" do 
#     it "updates a user" do
#       user = create(:user)
#       put "/users/#{user.id}", params: { user: { name: user.name, email: user.email, age: user.age } }
#       expect(response).to redirect_to(user_path(id: user.id))
#     end

#     it "PUT #update user failed" do
#       user = create(:user)
#       put "/users/#{user.id}", params: { user: { email: '' } }
#       expect(response).to have_http_status(:unprocessable_entity)
#     end
#   end
# end