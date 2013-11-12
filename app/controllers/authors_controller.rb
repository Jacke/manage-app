class AuthorsController < ApplicationController
  before_action :set_author, only: [:destroy, :edit, :update]

  # GET /authors
  # GET /a.json
  def index
    @authors = Author.all
  end

  def edit

  end
  def new
    @author = Author.new
  end
  def create 
    @author = Author.new(author_params)
    if @author.save
      respond_to do |format|
      format.html { redirect_to authors_path, notice: 'author was successfully created.' }
      format.json { head :no_content }
      end
    else
      respond_to do |format|
      format.html { render action: 'new' }
      format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url }
      format.json { head :no_content }
    end
  end
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to authors_path, notice: 'author was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white user through.
    def author_params
      params[:author]
    end
end

