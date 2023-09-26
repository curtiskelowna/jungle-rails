require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be valid with all fields filled' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@gmail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end
    it 'should not be valid without a first name' do
      @user = User.new(
        first_name: nil,
        last_name: 'Doe',
        email: 'johndoe@gmail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'should not be valid without a last name' do
      @user = User.new(
        first_name: 'John',
        last_name: nil,
        email: 'johndoe@gmail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'should not be valid without an email' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: nil,
        password: '123456',
        password_confirmation: '123456'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'should not be valid without a password' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@gmail.com',
        password: nil,
        password_confirmation: '123456'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'should not be valid without a password confirmation' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@gmail.com',
        password: '123456',
        password_confirmation: nil
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'should not be valid if password and password confirmation do not match' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@gmail.com',
        password: '123456',
        password_confirmation: '654321'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate if credentials are valid' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@gmail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      @user.save
      expect(User.authenticate_with_credentials('johndoe@gmail.com', '123456')).not_to be nil
      expect(User.authenticate_with_credentials('   johndoe@gmail.com   ', '123456')).not_to be nil
      expect(User.authenticate_with_credentials('johnDOE@gmail.com', '123456')).not_to be nil
    end
  end
end
