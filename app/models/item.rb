class Item
  include Mongoid::Document
  include Mongoid::Search
  
  field :title, type: String
  field :item_type_id, type: BSON::ObjectId
  belongs_to :item_type
 #field :pricetax, type: String
  #field :pages,   type: Integer
  #field :year, type: Integer
  #field :onpn, type: String 
  field :author, type: Array 
  #field :header, type: String 
  #field :std, type: String 
  #field :price, type: String
  field :publisher, type: String 
  field :price, type: Integer
  field :old_price, type: Integer
  field :visibility, type: Boolean
  field :weight, type: Integer
  field :description, type: String
  field :meta_tags, type: String
  #field :translate, type: String 
  #field :sid, type: String
  #field :year, type: Integer 
  field :genre, type: String
  #field :series, type: String 
  #field :format, type: String 
  #field :isbn, type: String 
  #field :article, type: String
  #field :ean, type: String 
  field :moderation, type: Boolean
  field :category, type: String 
  #field :presence, type: Boolean
  embeds_many :nexuses
  has_many :publishers
  has_many :prop_assigns
  accepts_nested_attributes_for :prop_assigns
  search_in :title, :author# => :author
end
