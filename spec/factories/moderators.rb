FactoryGirl.define do
  factory :moderator, class: 'Moderator' do
    sequence(:email) { |i| "name#{i}@site.com"}
    password '123'
    password_confirmation '123'
  end
end