require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	
	test "Index links direct correctly" do
		get root_path
		assert_template 'posts/index'
		assert_select "a[href=?]", root_path, count: 2
	end
end
