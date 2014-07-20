FactoryGirl.define do
  factory :posts do

    sequence(:username) { |n| "svaar #{n}" }
    sport "rugby"
    position "Prop"
    status "Boston rocks"
    avatar { File.new("#{Rails.root}/spec/fixtures/avatar.jpeg") }
  end
end
