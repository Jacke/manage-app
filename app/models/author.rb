class Author
  include Mongoid::Document
  field :name, type: String
  #field :type, type: String


 # scope :recommend, where(recommend: true)


end
