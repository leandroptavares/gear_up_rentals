class ItemsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].present?
      @items = Item.where(category: params[:category])
    else
      @items = Item.all
    if params[:search].present?
      @items = Item.search_by_title_and_category_and_location(params[:search])
    else
      @items = Item.all
    end
  end
    @markers = @items.geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {item: item})
      }
    end
  end

  def show
    @item_id = params[:item_id]
    @booking = Booking.new(item_id: @item_id)
    @review = Review.new(item_id: @item_id)
    @reviews = Review.where(item_id: @item.id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to my_items_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to my_items_path
  end

  def destroy
    @item.destroy
    redirect_to my_items_path, status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :category, :location, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
