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
    @nexuse_report = NexuseReportLong.new(params[:nexuse_report])
    @assets = @nexuse_report.assets.page(params[:page])
    render :action => :index 
  end
  
  def category
    @categories = Nexuse.distinct(:category)
    @genres = Nexuse.distinct(:genre)
    @formats = Nexuse.distinct(:format)
    @authors = Nexuse.distinct(:author)
    @categories << user_categories("category")
    @genres << user_categories("genre")
    @formats << user_categories("format")
    @authors << user_categories("author")
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
    @category = Category.new
  end

  private
  def user_categories(type)
    Category.where(type: type).pluck(:title)
  end
end

