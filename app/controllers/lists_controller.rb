class ListsController < ApplicationController
  before_action :set_list, only: [:destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  def upload
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params[:list]
    end
end
