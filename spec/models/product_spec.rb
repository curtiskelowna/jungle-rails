require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid with valid attributes' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', price: 100, quantity: 10, category: @category)
      expect(@product).to be_valid
    end

    it 'should not be valid without a name' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: nil, price: 100, quantity: 10, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not be valid without a price' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', price: nil, quantity: 10, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price cents must be greater than 0")
    end

    it 'should not be valid without a quantity' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', price: 100, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not be valid without a category' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', price: 100, quantity: 10, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
