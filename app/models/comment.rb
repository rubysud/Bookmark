class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :commentforbook
  belongs_to :book 
end
