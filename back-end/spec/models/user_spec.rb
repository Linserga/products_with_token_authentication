require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) {FactoryGirl.create(:user)}

	subject { user }

	it { should be_valid }

	context 'it should not be valid without email' do
		before { user.email = ''}
		it { should be_invalid}
	end

	context 'it should not be valid with long email' do
		before { user.email = 'a' * 255 + '@mail.ru'}
		it { should be_invalid}
	end

	context 'it should not be valid with short password' do
		before { user.password = 'a'}
		it { should be_invalid}
	end

	it 'should be valid with correct email format' do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]

		valid_addresses.each do |valid_address|
			user.email = valid_address
			expect(user).to be_valid
		end
	end

	it 'should not be valid with incorrect email format' do
		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]

		invalid_addresses.each do |invalid_address|
			user.email = invalid_address
			expect(user).to be_invalid
		end
	end

	it 'should avoid saving duplicate users' do
		dup_user = user.dup
		expect(dup_user).to be_invalid
	end

	it 'deletes dependent products' do
		products = user.products
		expect do
			user.destroy
		end.to change(Product, :count).by(-1)
		expect(products.size).to eq(0)
	end
end
