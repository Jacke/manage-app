class TypeField
  include Mongoid::Document
  field :title, type: String
  field :datatype, type: String
  belongs_to :item_type
  has_many :prop_assigns, dependent: :delete_all
  accepts_nested_attributes_for :prop_assigns  

 # scope :recommend, where(recommend: true)


end
