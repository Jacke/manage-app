class ItemProp
  include Mongoid::Document
  field :title, type: String
  #field :size, type: String
  #field :weight,   type: String
  #field :material, type: String
  belongs_to :item_type
  has_many :prop_assigns
  accepts_nested_attributes_for :prop_assigns  

 # scope :recommend, where(recommend: true)


end
