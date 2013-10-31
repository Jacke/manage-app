class Author
  include Mongoid::Document
  field :name, type: String
  #field :type, type: String
  has_many :creations, validate: false

 # scope :recommend, where(recommend: true)


end
