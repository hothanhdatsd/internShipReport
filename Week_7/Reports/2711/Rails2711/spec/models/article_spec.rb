# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'validates the presence of a name' do
    article = FactoryBot.create(:article)
    expect(article).to be_valid
  end
end
