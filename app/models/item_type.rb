class ItemType
  include Mongoid::Document
  field :title, type: String
  field :size, type: String
  field :weight,   type: String
  field :material, type: String


 # scope :recommend, where(recommend: true)


end
