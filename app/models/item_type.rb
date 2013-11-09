class ItemType
  include Mongoid::Document
  field :title, type: String
  has_many :type_fields, dependent: :delete_all
#  embedded_in :items, :inverse_of => :item_type
  has_many :items 
# scope :recommend, where(recommend: true)


end
