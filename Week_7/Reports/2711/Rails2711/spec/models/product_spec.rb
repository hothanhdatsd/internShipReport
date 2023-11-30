# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'validates the presence of a name' do
    product = create(:product)
    expect(product).to be_valid
  end
end
