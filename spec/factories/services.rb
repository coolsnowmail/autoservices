FactoryGirl.define do
  factory :service, class: 'Service' do
    sequence(:name) { |i| "Service#{i}"}
  end
end