class List
  include Mongoid::Document
  #field :title, type: String
  #field :body, type: String
  #field :recommend, type: Boolean
  field :'file-name', type: String
  field :sid, type: String
  field :timestamp, type: String
  field :parsed, type: Boolean
  #scope :recommend, where(recommend: true)
end
