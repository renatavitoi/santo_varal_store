FactoryBot.define do
  factory :product do
    name { "race bike" }
    description { "nice bike" }
    image_url { "Anything" }
    colour { "black" }
    price { 100 }
  end
end
