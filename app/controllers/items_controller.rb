class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :link]

def index
    logger.info(params[:moderation])
    @items = Item.where(moderation: true).to_a  if params[:moderation]
    @items = Item.where(moderation: false).to_a if params[:moderation] == "false"
    @items = Item.where(visibility: true).to_a if params[:visibility] 
    @items = Item.all.to_a unless params[:moderation].present? 

end
  def show
    @item = Item.find(params[:id])
    @positions = Nexuse.where(item_id: params[:id]).to_a
    @similar = Nexuse.full_text_search(@item.title)
  end
  def new
    @item = Item.new
    @author = Category.where(type: "author").distinct(:title)
    @publisher = Category.where(type: "publisher").distinct(:title) 
    @genre = Category.where(type: "genre").distinct(:title)
    @category = Category.where(type: "category").distinct(:title)
  end
  def create
    logger.info(item_params)
    item_params["author"] = item_params["author"].delete("")
    logger.info(item_params)
    
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    #find positions
    # position article
    # link_position(params)
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        @item.update_attribute(:moderation, true)
        
        if params[:position]
          format.html { redirect_to link_item_path(position: params[:position]), notice: 'item was successfully updated.' }
        else
          format.html { redirect_to @item, notice: 'item was successfully updated.' }
        end
        
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
  def link
    @item = Item.find(params[:id])
    @items = Nexuse.all
     logger.info(@item)
    #@nexuse.update_attribute(:item_id, @item.id)
  end
  def link_position
    @nexuse = Nexuse.where(article: params[:position][:article]).to_a.first
    #@item = Item.find(params[:position][:item])
    @nexuse.update_attribute(:item_id, params[:position][:item])
    redirect_to items_path
  end
  def approve
    if current_user.admin
      @item = Item.find(params[:id])
      @item.moderation = true
      @item.save
    redirect_to items_path
    else
    redirect_to items_path
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :publisher, :genre, :moderation, :category, :price, :old_price, :visibility, :item_type, :weight, :description, :meta_tags, :author => [])     
    end
end
