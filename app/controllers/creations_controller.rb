class CreationsController < ApplicationController
  before_action :set_creation, only: [:destroy, :edit, :update] 
  before_action :set_author, except: [:edit, :update, :create]
  # GET /creations
  # GET /a.json
  def index
    #@creations = Creation.criteria.for_ids([@author.id])
    @creations = Creation.where(:authors_ids.in => [@author.id])
  end

  def edit

  end
  def new
    @creation = Creation.new
  end
  def create 
    @creation = Creation.new(creation_params)
    if @creation.save
      respond_to do |format|
      format.html { redirect_to authors_path, notice: 'Произведение созданно.' }
      format.json { head :no_content }
      end
    else
      respond_to do |format|
      format.html { render action: 'new' }
      format.json { render json: @creation.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /creations/1
  # DELETE /creations/1.json
  def destroy
    @creation.destroy
    respond_to do |format|
      format.html { redirect_to creations_url }
      format.json { head :no_content }
    end
  end
  def update
    respond_to do |format|
      if @creation.update(creation_params)
        format.html { redirect_to authors_path, notice: 'creation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @creation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creation
      @creation = Creation.find(params[:id])
    end
    def set_author
      @author = Author.find(params[:author_id])
    end
    # Never trust parameters from the scary internet, only allow the white user through.
    def creation_params
      if params[:creation][:authors_ids].present?
        authors = []
        params[:creation][:authors_ids][0].split(", ").each do |a|
          authors << Author.where(name: a).first.id if Author.where(name: a).first.present?
        end
        params[:creation][:authors_ids] = authors
      end
      params[:creation]
    end
end

