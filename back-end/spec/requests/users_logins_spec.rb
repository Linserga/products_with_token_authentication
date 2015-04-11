require 'rails_helper'

RSpec.describe "UsersLogins", type: :request, js: true do
  
  before { @user = FactoryGirl.create(:user)}

  subject { page }

  context 'login with valid info' do
  	before { 
  		visit '/#/login'
  		find(:xpath, "//input[@type='email']").set(@user.email)
  		find(:xpath, "//input[@type='password']").set(@user.password)
  		find_button('Log in').click
  	}

  	it { should have_content('Logout') }
  end

  context 'login with invalid info' do
  	before {
  		visit '/#/login'
  		find(:xpath, "//input[@type='email']").set('Jam@sam.com')
  		find(:xpath, "//input[@type='password']").set("Trash")
  		find_button('Log in').click
  	}

  	it { should have_content('Wrong Credentials')}
  end
end
