class Suplier
  include Mongoid::Document
  field :sid,   type: String
  # fields for supliers
  field :title, type: Integer
  field :pricetax, type: Integer
  field :pages,   type: Integer
  field :year, type: Integer
  field :onpn, type: Integer
  field :author, type: Integer 
  field :header, type: Integer
  field :std, type: Integer 
  field :price, type: Integer
  field :publisher, type: Integer 
  field :translate, type: Integer
  field :year, type: Integer 
  field :genre, type: Integer
  field :series, type: Integer 
  field :format, type: Integer
  field :isbn, type: Integer
  field :article, type: Integer
  field :ean, type: Integer
  field :category, type: Integer

 # scope :recommend, where(recommend: true)


end
