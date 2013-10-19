class Nexuse
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :pricetax, type: String
  field :pages,   type: Integer
  field :year, type: Integer
  field :onpn, type: String 
  field :author, type: String 
  field :header, type: String 
  field :std, type: String 
  field :price, type: String
  field :publisher, type: String 
  field :translate, type: String 
  field :sid, type: String
  field :year, type: Integer 
  field :genre, type: String
  field :series, type: String 
  field :format, type: String 
  field :isbn, type: String 
  field :article, type: String
  field :ean, type: String 
  field :moderation, type: Boolean
  field :category, type: String 
  field :presence, type: Boolean
  # Item link
  field :item_id, type: String
  PRESENCE = "presence"
  NOTPRESENT = "notpresent"
  scope :presence, where(presence: true)
  scope :notpresent, where(presence: false)
 # scope :recommend, where(recommend: true)
  def self.flush
    self.all.each {|i| i.destroy }
  end
end
