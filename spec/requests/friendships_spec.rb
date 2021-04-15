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
    @test_friend_request = User.create!({ name: 'Jonny',
                                          email: 'jonny@gmail',
                                          password: '123456',
                                          password_confirmation: '123456' })
    @friendship = Friendship.create!({ user_id: @test_friend_request.id,
                                       friend_id: @test_user.id,
                                       accepted: nil })

    @post = Post.create!({ user_id: @test_friend_request.id,
                           content: 'Test post from John' })
  end

  ## Creating
  
