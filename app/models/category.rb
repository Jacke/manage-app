class Category
  include Mongoid::Document
  include Mongoid::Tree
   include Mongoid::Search

  field :title, type: String
  field :type, type: String
 search_in :title, :type# => :author


 # scope :recommend, where(recommend: true)


end
