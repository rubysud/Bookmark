
class Book < ActiveRecord::Base
   attr_accessible :title, :author, :id, :image
    has_attached_file :image,styles: { large: "2000x2000>",medium: "3000x3000>", thumb: "100x100>" }
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
   validates_presence_of :title
   validates_uniqueness_of [:title, :author]


  has_many :reviews , dependent: :delete_all
  has_many :comments , dependent: :delete_all
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :reviews
end
