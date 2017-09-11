FactoryGirl.define do
  factory :comment, class: 'Comment' do
    sequence(:mail) { |i| "name#{i}@site.com"}
    sequence(:text) { |i| "Hospitality, Banking, Mining, Real-Estate, Real-Estate, Administration, Marketing, Construction, Technology, Design, Advertising, Marketing, Sales, Technology, Farming, Community-Services, Retail, Manufacturing, Sales, Government, Retail, Marketing, Marketing, Real-Estate, Accounting, Mining, B{i}"}
  end
end