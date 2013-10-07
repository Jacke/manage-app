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

end

