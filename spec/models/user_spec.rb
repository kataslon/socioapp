require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create email: 'kataslon@yandex.ru', password: '123456', password_confirmation: '123456' }

  it 'should not allow to create another user with the same email' do
    another_user = User.create email: 'kataslon@yandex.ru', password: '123456', password_confirmation: '123456'
    expect( another_user.errors.full_messages ).to eq ["Email has already been taken"]
  end

  it 'should not allow to create user with incorrect password confirmation' do
    second_user = User.create email: 'kataslon_1@yandex.ru', password: '123456', password_confirmation: '654321'
    expect( second_user.errors.full_messages ).to eq ["Password confirmation doesn't match Password"]
  end

  it 'should not allow to create user without password' do
    third_user = User.create email: 'kataslon_1@yandex.ru', password: '', password_confirmation: ''
    expect( third_user.errors.full_messages ).to eq ["Password can't be blank", "Password is too short (minimum is 6 characters)"]
  end

  it "should save email addresses as lower-case" do
    user2 = User.create email: 'KAtaSLon_2@yandex.ru', password: '123456', password_confirmation: '123456'
    expect( user2.email ).to eq 'kataslon_2@yandex.ru'
  end
end
