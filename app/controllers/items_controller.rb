class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :link]

  def index
    logger.info(params[:moderation])
    @items = Item.where(moderation: true).to_a  if params[:moderation]
    @items = Item.where(moderation: false).to_a if params[:moderation] == "false"
    @items = Item.where(visibility: true).to_a if params[:visibility] == "true" 
    @items = Item.all.to_a unless params[:moderation].present? || params[:visibility].present? 

  end
  def show
    @item = Item.find(params[:id])
    @authors = Author.find(@item.authors_ids)
    @positions = Nexuse.where(item_id: params[:id]).to_a
    @similar = Nexuse.full_text_search(@item._keywords)
    @type_fields = @item.item_type.type_fields if @item.item_type.present?
  end
  def new
    @item = Item.new
    @author = Category.where(type: "author").distinct(:title)
    @publisher = Category.where(type: "publisher").distinct(:title) 
    @genre = Category.where(type: "genre").distinct(:title)
    @category = Category.where(type: "category").distinct(:title)
    @related_pos = Nexuse.find(params[:position]) if params[:position]
    @item_type = ItemType.find(params[:item_type])
    @item_fields = @item_type.type_fields
  end
  def create
    logger.info(item_params)
    
    #item_params["author"] = item_params["author"].delete("")
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

  def update_fields
     logger.info("++++++++++++++++++++++++++++++")
     @item = Item.find(params[:id])
     # get required fields
     fields = []
     @item.item_type.type_fields.each {|f| fields << (f.id.to_s) }
     # collect fields
     
     prop_attr = []
     fields.each { |f| prop_attr << params[f] }
     logger.info(prop_attr)
     @item.update_attributes(prop_assigns_attributes: prop_attr) if prop_attr.present?
     redirect_to item_path(params[:id])
  end

  def edit
    #find positions
    # position article
    # link_position(params)
    @item_fields = @item.item_type.type_fields if @item.item_type.present?
    @item_fields = ItemType.first.type_fields unless @item.item_type.present?
  end

  def update
    logger.info("=============>first")
    a = item_params
    logger.info("to update \/")
    logger.info(a)
    logger.info("to update =================^")
    respond_to do |format|
      if @item.update(a)
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
      params.require(:item).permit!
       #.permit(
       #       :title, :item_type_id, 
       #       :publisher, 
       #       :genre, :moderation, :category, 
       #       :price, :old_price, :visibility, 
       #       :item_type, :weight, :description, 
       #       :meta_tags, :authors_ids => [], "authors_ids" => [])     
       if params[:item][:authors_ids].present? && (params[:item][:authors_ids].first.kind_of?(String))
        authors = []
        params[:item][:authors_ids].first.split(", ").each do |a|
          logger.info("loop")
          authors << Author.where(name: a).first.id if Author.where(name: a).first.present?
        end
        logger.info(authors)
        params[:item][:authors_ids] = authors
      end
      params[:item]
    end
end
