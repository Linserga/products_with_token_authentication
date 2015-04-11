FactoryGirl.define do
  factory :user do
    email "user@example.org"
		password "123"
		authenticate_token "MyString"

		after(:create) do |user, evaluator|
			create_list(:product, 1, user: user)
		end
  end

  factory :product do
		name "Sample Product"
		quantity "9"
		price "47.57"

		user
  end
end
