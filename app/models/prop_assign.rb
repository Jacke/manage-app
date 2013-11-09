class PropAssign
  include Mongoid::Document
  field :item_id, type: String
  field :item_prop_id, type: String
  field :val,   type: String
  belongs_to :item
  belongs_to :item_prop

 # scope :recommend, where(recommend: true)


end
