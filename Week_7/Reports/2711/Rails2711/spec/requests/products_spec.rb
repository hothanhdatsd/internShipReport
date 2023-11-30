# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  it 'returns a successful response' do
    get '/users'
    expect(response).to have_http_status(200)
  end
  # describe "GET #users" do
  #   it "returns a successful response" do
  #     post '/users',params: { user: FactoryBot.create(:user)  }
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
