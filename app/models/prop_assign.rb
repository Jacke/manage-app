class PropAssign
  include Mongoid::Document
  field :item_id, type: String
  field :type_field_id, type: String
  field :val,   type: String
  belongs_to :item
  belongs_to :type_field

 # scope :recommend, where(recommend: true)


end
