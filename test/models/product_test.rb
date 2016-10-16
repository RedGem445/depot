require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	test "product price must be positive" do
		# цена товара должна быть положительной
		product = Product.new(title: "My Book Title",
								description: "yyy",
								image_url: "zzz.jpg")
		product.price = -1
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"],

		product.errors[:price]
		# должна быть больше или равна 0.01
		product.price = 0
		
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"],

		product.errors[:price]

		product.price = 1
		assert product.valid?
	
	end
end