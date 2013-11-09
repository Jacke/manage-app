class ItemTypesController < ApplicationController
  before_action :set_item_type, only: [:show, :edit, :edit_fields, :update, :destroy]

  # GET /supliers
  # GET /supliers.json
  def index
    @types = ItemType.all
  end

  # GET /supliers/1
  # GET /supliers/1.json
  def show
  end

  # GET /supliers/new
  def new
    @item_type = ItemType.new
  end

  # GET /supliers/1/edit
  def edit
  end

  def edit_fields
  end
  # POST /supliers
  # POST /supliers.json
  def create
    @item_type = ItemType.new(item_type_params)

    respond_to do |format|
      if @item_type.save
        format.html { redirect_to @item_type, notice: 'ItemType was successfully created.' }
        format.json { render action: 'show', status: :created, location: @suplier }
      else
        format.html { render action: 'new' }
        format.json { render json: @item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supliers/1
  # PATCH/PUT /supliers/1.json
  def update
    respond_to do |format|
      if @item_type.update(item_type_params)
        format.html { redirect_to @item_type, notice: 'ItemType was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supliers/1
  # DELETE /supliers/1.json
  def destroy
    @item_type.destroy
    respond_to do |format|
      format.html { redirect_to item_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_type
      @item_type = ItemType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_type_params
      params[:item_type]
    end
end
