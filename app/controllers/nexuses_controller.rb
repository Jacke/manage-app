class NexusesController < ApplicationController
  before_action :set_nexuse, only: [:show, :edit, :update, :destroy]

  # GET /nexuses
  # GET /nexuses.json
def index
  @nexuses = Nexuse.all.to_a
  logger.info("===================>")
  logger.info(params)
  #@item_tab = Nexuse.all.find_for_table(params)
end

  # GET /nexuses/1
  # GET /nexuses/1.json
  def show
    @position = Nexuse.find(params[:id])
    @similar = Nexuse.full_text_search(@position.title).union.full_text_search(@position.author)
    @similar_item = Item.full_text_search(@position.title).union.full_text_search(@position.author)
  end

  # GET /nexuses/new
  #def new
  #  @nexuse = Nexuse.new
  #end

  # GET /nexuses/1/edit
  def edit
  end

  # POST /nexuses
  # POST /nexuses.json
  #def create
  #  @nexuse = Nexuse.new(nexuse_params)
#
#  #  respond_to do |format|
#  #    if @nexuse.save
#  #      format.html { redirect_to @nexuse, notice: 'Nexuse was successfully created.' }
#  #      format.json { render action: 'show', status: :created, location: @nexuse }
#  #    else
#  #      format.html { render action: 'new' }
#  #      format.json { render json: @nexuse.errors, status: :unprocessable_entity }
#  #    end
#  #  end
  #end

  # PATCH/PUT /nexuses/1
  # PATCH/PUT /nexuses/1.json
  def update
    respond_to do |format|
      if @nexus.update(nexuse_params)
        @nexus.update_attribute(:moderation, true)
        format.html { redirect_to @nexus, notice: 'Nexuse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nexus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nexuses/1
  # DELETE /nexuses/1.json
  def destroy
    @nexus.destroy
    respond_to do |format|
      format.html { redirect_to nexuses_url }
      format.json { head :no_content }
    end
  end
  def destroy_all
    Nexuse.flush
    redirect_to nexuses_url, notice: 'База очищенна.'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nexuse
      @nexus = Nexuse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nexuse_params
      params.require(:nexuse).permit(:title, :pricetax, :pages, :year, :onpn, :author, :header, :std, :price, :publisher, :translate, :sid, :genre, :series, :format, :isbn, :article, :ean, :moderation, :category, :presence)
    end
end
