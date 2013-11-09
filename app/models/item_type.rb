class ItemType
  include Mongoid::Document
  field :title, type: String
  has_many :item_props
#  embedded_in :items, :inverse_of => :item_type
  has_many :items 
# scope :recommend, where(recommend: true)


end
