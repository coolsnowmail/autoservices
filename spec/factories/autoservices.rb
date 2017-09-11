FactoryGirl.define do
  factory :autoservice, class: 'Autoservice' do
    sequence(:name) { |i| "name#{i}@site.com"}
    sequence(:address) { |i| "address#{i}"}
    sequence(:phone) { |i| "12321332423{i}"}
  end
end