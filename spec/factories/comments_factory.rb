FactoryBot.define do
  factory :comments do
    boby { "great comment" }
    rating  { 5 }
    product
    user
  end
end
