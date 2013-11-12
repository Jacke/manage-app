class Creation
  include Mongoid::Document
  field :name, type: String
  field :authors_ids, type: Array
  #field :type, type: String
  has_many :authors, validate: false
  has_one :item
 # scope :recommend, where(recommend: true)


end
