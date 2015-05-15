require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def setup
		@post = Post.new(title: "Tuna Roll", url: "http://twitter.com/tunaroll", content: "Batter up")
	end

	test "Post should be valid" do
		assert @post.valid?
	end
end
