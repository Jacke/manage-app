class PublishersController < ApplicationController
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  def index
    @publishers = Publisher.all
  end
  def show
  end
  def new
    @publisher = Publisher.new
  end
  def edit
  end
  def create
    @publisher = Publisher.new(publisher_params)

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to @publisher, notice: 'Publisher was successfully created.' }
        format.json { render action: 'show', status: :created, location: @publisher }
      else
        format.html { render action: 'new' }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to @publisher, notice: 'Publisher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @publisher.destroy
    respond_to do |format|
      format.html { redirect_to publishers_url }
      format.json { head :no_content }
    end
  end

  private
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end
    def publisher_params
      params[:publisher]
    end
end
