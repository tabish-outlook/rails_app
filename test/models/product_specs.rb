require 'test_helper'

class ProductSpecs < ActiveSupport::TestCase
  test 'should not save the product without name' do
    product = Product.new(description: 'test description..!')
    assert_not product.save, 'Saved the user without a name!'
  end

  test 'Should not save product wihtout BRAND' do
    product = Product.new(brand: 123)
    assert_not product.save, 'Saved product without brand'
  end

end
