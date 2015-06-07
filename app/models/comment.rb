class Comment < ActiveRecord::Base
  validates_presence_of :user_id, :title, :content

  belongs_to :user
  belongs_to :post
end
