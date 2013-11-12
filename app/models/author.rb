class Author
  include Mongoid::Document
  field :name, type: String
  #field :type, type: String
  has_many :creations, validate: false
  include Mongoid::Search
  search_in :name #, :type# => :author
  accepts_nested_attributes_for :creations
 # scope :recommend, where(recommend: true)


end
