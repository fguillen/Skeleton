FactoryGirl.define do
  factory :model do
    title "Performance Title"
    association :other_model
    attach { File.new("#{Rails.root}/test/fixtures/images/extras1.jpg") }
    sequence(:name) { |n| "Gift Card Provider Name #{n}" }
  end
end