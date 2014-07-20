FactoryGirl.define do
  factory :comments do

    sequence(:username) { |n| "svaar #{n}" }
    sport "rugby"
    position "Prop"
    comment "Boston rocks"
    avatar { File.new("#{Rails.root}/spec/fixtures/avatar.jpeg") }
  end
end
