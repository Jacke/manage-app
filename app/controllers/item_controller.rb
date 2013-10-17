class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :link_position]

def index
  @nexuses = Item.all.to_a
end
  def show

  end
  def new
    @nexuse = Item.new
    @author = Item.all.pluck(:author) 
    @publisher = Item.all.pluck(:publisher) 
    @genre = Item.all.pluck(:genre)
    @category = Item.all.pluck(:category) 
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
        format.html { redirect_to @item, notice: 'item was successfully updated.' }
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
  def link_position
    @nexuse = Nexuse.find(params[:position])
    @nexuse.update_attribute(:item_id, @item.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :author, :publisher, :genre, :moderation, :category)     
    end
end
