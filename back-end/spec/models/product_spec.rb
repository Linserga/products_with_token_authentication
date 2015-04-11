require 'rails_helper'

RSpec.describe Product, type: :model do
	let(:product){ FactoryGirl.create(:product)}

	subject { product }

	it { should be_valid }

	context 'it should not be valid without name' do
		before { product.name = ''}
		it { should_not be_valid }
	end

	context 'it should not be valid without quantity' do
		before { product.quantity = nil }
		it { should be_invalid }
	end

	context 'it should not be valid without price' do
		before { product.price = nil }
		it { should be_invalid }
	end

	context 'it should not be valid if price in not a number' do
		before { product.price = 'alpha'}
		it { should be_invalid }
	end

	context 'it should not be valid if quantity is not a number' do
		before {product.quantity = 'sam'}
		it { should be_invalid }
	end
end
