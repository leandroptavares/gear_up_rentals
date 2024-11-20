class ItemsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].present?
      @items = Item.where(category: params[:category])
    else
      @items = Item.all
    end
  end

  def show
    @item_id = params[:item_id]
    @booking = Booking.new(item_id: @item_id)
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

  def destroy
    @item.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :category, :location, :image_url)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
