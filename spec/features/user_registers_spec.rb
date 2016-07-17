require 'rails_helper'

feature 'user registers an account' do
	scenario 'successfully' do
		visit '/user/sign_up'

		fill_in 'Username', :with => 'username'
		fill_in 'Email', :with => 'personal@example.com'
		fill_in 'Password', :with => 'password'
		fill_in 'Password Confirm', :with => 'password'
		click_button 'Sign up'

		expec(page).to have_content 'wellcome! you have sign up successfully'
	end
end