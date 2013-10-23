class NexuseReportsController < ApplicationController
  PER_PAGE = 5
  def index
    @nexuse_report = NexuseReport.new(params[:nexuse_report])
    logger.info(@nexuse_report.assets)
    logger.info(params[:nexuse_report]) if params[:nexuse_report]
    logger.info(@nexuse_report.assets.pluck(:genre)) if @nexuse_report.assets
    @assets = @nexuse_report.assets.page(params[:page])
  end
  def long
    @nexuse_report = NexuseReport.new(params[:nexuse_report])
    @assets = @nexuse_report.assets.page(params[:page])
    render :action => :index 
  end
  
  def category
    @categories_root = Category.root

    #@genres = Nexuse.distinct(:genre)
    #@formats = Nexuse.distinct(:format)
    #@authors = Nexuse.distinct(:author)
    @categories = user_categories("category").roots
    @categories = @categories.to_a unless @categories.kind_of?(Array)
    @genres = user_categories("genre").roots
    @genres = @genres.to_a unless @genres.kind_of?(Array)
    @formats = user_categories("format")
    @authors = user_categories("author")
  end
  
  def create_category
    parameters = {type: params[:type]}.merge params[:category]
    logger.info(parameters)
    logger.info("<<<<<<<<<<<<<<<<<<<<<")
    @category = Category.new(parameters)
    if @category.save
      redirect_to nexuse_category_path
    else 
      redirect_to new_category_path
    end
  end

  def new_category
    @all_categories = Category.all
    @category = Category.new
  end
  def destroy
    @list = Category.find(params[:id])
    @list.destroy
    respond_to do |format|
      format.html { redirect_to nexuse_category_url }
      format.json { head :no_content }
    end
  end

  private
  def user_categories(type)
    Category.where(type: type)
  end
end

