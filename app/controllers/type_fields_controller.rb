class TypeFieldsController < ApplicationController
  before_action :set_item_type, only: [ :create, :new, :edit, :update, :destroy]
  before_action :set_field,     only: [ :edit, :update, :destroy]
  def index
    @item_type = ItemType.find(params[:item_type_id])
    @fields = TypeField.where(item_type_id: @item_type.id).to_a    
  end
  def edit
  end
  def create
    @field = TypeField.new(item_type_id: @item_type.id)
    @field.update_attributes(field_params)
    logger.info(field_params)
    @field.save
    redirect_to item_type_type_fields_path(item_type_id: @item_type.id)
  end
  def new
    @field = TypeField.new(item_type_id: @item_type.id)
  end
  def update
    @field.update_attributes(field_params)
    @field.save
    redirect_to item_type_type_fields_path(item_type_id: @item_type.id)
  end
  def destroy
    @field.destroy
    redirect_to item_type_type_fields_path(item_type_id: @item_type.id)
  end
  private
  def set_item_type
    @item_type = ItemType.find(params[:item_type_id])
  end
  def set_field
    @field = TypeField.find(params[:id])
  end
  def field_params
    params[:type_field]
  end

end
