# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sk_user_id 1
    access_token "MyString"
    name "MyString"
  end
end
