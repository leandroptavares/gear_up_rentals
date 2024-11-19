class ItemsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to item_path(@item)
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :category, :location, :image_url)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
