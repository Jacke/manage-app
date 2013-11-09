class Publisher
  include Mongoid::Document
  field :title, type: String
  field :english_title, type: String
  field :year, type: Integer
  field :description, type: String
  #field :type, type: String
  #has_many :creations, validate: false
  belongs_to :item
 # scope :recommend, where(recommend: true)


end
