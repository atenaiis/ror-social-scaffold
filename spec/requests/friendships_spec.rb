require 'rails_helper'

  describe 'testing friendship features', type: :feature do
    before :each do
      @test_friend = User.create!({name: 'Mariana', :email => "ate@gmail", :password => "123456", :password_confirmation => "123456" })
        @test_user = User.create!({name: 'REGINA', :email => "regi@gmail", :password => "123456", :password_confirmation => "123456" })	
    end
    describe 'Creating Requests login with Mariana' do
      before :each do
        visit 'users/sign_in'
          fill_in 'Email', with: 'regi@gmail'
            fill_in 'Password', with: '123456'
            click_button 'commit'
      end
      it 'user was created' do
        visit 'users'
        expect(page).to have_content 'Mariana'
      end
    end
  end
