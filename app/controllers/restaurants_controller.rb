class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :query_data ]

  def index
    @restaurants = current_user.restaurants
    if params[:query].present?
      @restaurants = @restaurants.general_search(params[:query])
    end
    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { restaurant: restaurant })
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    unless current_user.restaurants.include? @restaurant
      render :index
    end
    @restaurant_images = @restaurant.images.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def downloadqr
    @restaurant = Restaurant.find(params[:restaurant_id])
    unless current_user.restaurants.include? @restaurant
      render :index
    end
    url = request.url.split('/')
    url.pop
    url = url.join('/')
    send_data RQRCode::QRCode.new(url+"/query_data").as_png(size: 300, type: 'image/png', disposition: 'attachment')
  end

  def query_data
    restaurant = Restaurant.includes(dishes: [:ingredients]).find(params[:restaurant_id])
    render json: restaurant.to_json(:include => [ :dishes => {:include => [  :image, :ingredients => {include: :image}]} ])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:longitude, :latitude, :name, :description, images: [])
  end
end
