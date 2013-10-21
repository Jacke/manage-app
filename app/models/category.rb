class Category
  include Mongoid::Document
  field :title, type: String
  field :type, type: String


 # scope :recommend, where(recommend: true)


end
