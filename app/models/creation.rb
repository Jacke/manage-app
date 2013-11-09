class Creation
  include Mongoid::Document
  field :name, type: String
  field :authors_id, type: Integer
  #field :type, type: String
  has_many :authors, validate: false

 # scope :recommend, where(recommend: true)


end
