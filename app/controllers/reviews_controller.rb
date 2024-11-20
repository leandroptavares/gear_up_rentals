class ReviewsController < ApplicationController
  def new
    @review = Review.find(params[:item_id])
    @review = Review.new
  end

  def create
    @item = Item.find(params[:item_id])

    if !current_user
      redirect_to item_path(@item), notice: "Please login first"
      return
    end

    @review = Review.new(review_params)
    @review.item = @item
    @review.user = current_user

    if @review.save
      redirect_to item_path(@item)
    else
      redirect_to item_path(@item), alert: "Couldnt create review"
    end
  end

  def destroy
    @review = Review.find(params[:item_id])
    @review.destroy
    redirect_to item_path(@review.item)
  end

  private

  def review_params
    params.require(:review).permit(:comments, :rating, :item_id)
  end
end
