class BookingsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_booking, only: [:destroy, :show]

  def index
    @bookings = Booking.where(user_id: params[:user_id]).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to booking_path(@booking)
    else
      # render 'items/:id', status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :item_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
