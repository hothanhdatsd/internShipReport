# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'validates the presence of a name' do
    post = FactoryBot.create(:post)
    expect(post).to be_valid
  end
end
