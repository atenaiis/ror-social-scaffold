require 'rails_helper'

describe 'testing friendship features', type: :feature do
  before :each do
    @test_friend = User.create!({ name: 'Mariana',
                                  email: 'ate@gmail',
                                  password: '123456',
                                  password_confirmation: '123456' })
    @test_user = User.create!({ name: 'REGINA',
                                email: 'regi@gmail',
                                password: '123456',
                                password_confirmation: '123456' })
  end

  describe 'Creating Requests login with Mariana' do
    before :each do
      visit 'users/sign_in'
      fill_in 'Email', with: 'regi@gmail'
      fill_in 'Password', with: '123456'
      click_button 'commit'
      visit 'users'
    end
    it 'login was made' do
      expect(page).to have_content 'REGINA'
    end
    it 'users is listed in users index' do
      expect(page).to have_content 'Mariana'
    end

    it 'User model can get the list of friendships' do
      expect(@test_friend.accepted_friendships.class.to_s).to eql('Friendship::ActiveRecord_AssociationRelation')
    end
    it 'User model can get an array of his pending_friends' do
      expect(@test_friend.pending_request.class.to_s).to eql('Friendship::ActiveRecord_AssociationRelation')
    end

    it 'User returns a booelan if user is an invitee or not' do
      expect(@test_friend.invitee?(@test_user)).to eql(false)
    end

    it 'Friendship belongs to user' do
      association = Friendship.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'Friendship belongs to friend' do
      association = Friendship.reflect_on_association(:friend)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'Friendship has a foreign_key from friend table' do
      association = Friendship.reflect_on_association(:friend)
      expect(association.foreign_key).to eq('friend_id')
    end
  end
end
