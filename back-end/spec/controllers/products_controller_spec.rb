require 'rails_helper'

RSpec.describe Api::ProductsController, type: :controller do
	
	let!(:user) {FactoryGirl.create(:user)}

	before {
		controller.instance_variable_set(:@current_user, user)
		# allow(controller).to receive(:authenticate_user_from_token).and_return(user)
		# controller.class.skip_before_filter(:authenticate_user_from_token)
	}

	context 'Index' do
		it 'responds with success' do
			get :index, user_id: user.id
			expect(response).to have_http_status(200)
		end

		it 'renders json' do
			get :index, user_id: user.id
			parsed = JSON.parse(response.body)
			expect(parsed[0]['name']).to eq('Sample Product')
			expect(parsed.size).to eq(1)
		end
	end

	context 'Show' do
		it 'responds with success' do
			get :show, user_id: user.id, id: user.products.first.id
			expect(response).to have_http_status(200)
		end

		it 'renders json' do
			get :show, user_id: user.id, id: user.products.first.id
			parsed = JSON.parse(response.body)
			expect(parsed['name']).to match('Sample Product')
		end
	end

	# context 'Update' do
	# 	it 'should update name of the product' do
	# 		product = user.products.first
	# 		product.name = 'Salo'			
	# 		patch :update, user_id: user.id, id: product.id, product: { name: product.name }
	# 		product.reload
	# 		expect(user.products.first.name).to eq('Salo')
	# 	end
	# end

	context 'Destroy' do
		it 'should delete user' do
			expect do
				delete :destroy, user_id: user.id, id: user.products.first.id
			end.to change(Product, :count).by(-1)
		end
	end
end