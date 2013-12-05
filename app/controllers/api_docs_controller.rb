class ApiDocsController < ApplicationController
  respond_to :html, :json
  def index

  end
  def items
    @items = Item.all
  end
  def positions
    @positions = Nexuse.all
  end
  def category
    @category = Category.all
  end

 
end
