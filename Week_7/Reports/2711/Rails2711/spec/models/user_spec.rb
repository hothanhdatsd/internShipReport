require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:email) }
    it { should accept_nested_attributes_for(:products) }
    it { should have_rich_text(:name) }
    it { should have_one_attached(:picture) }
    it { should have_many(:products) }
  end
  describe "" do
  end
end
