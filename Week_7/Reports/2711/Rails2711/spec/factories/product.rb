FactoryBot.define do
  factory :product do
    title { Faker::Name.name }
    user_id { FactoryBot.create(:user).id } 
  end
end
