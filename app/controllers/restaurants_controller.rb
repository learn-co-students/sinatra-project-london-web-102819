class RestaurantsController < ApplicationController
    
  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :"restaurants/index"
  end

  get '/restaurants/new' do
    erb :"restaurants/new"
  end

  get '/restaurants/:id' do
      @restaurant = Restaurant.find(params[:id])
      erb :"restaurants/show"
  end

  patch '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    UserRestaurant.create(user_id: params[:user_id], restaurant_id: params[:id])

    redirect "/restaurants/#{@restaurant.id}"
  end

  post '/restaurants' do
      params["rating"] = params["rating"].to_i
      r = Restaurant.create(params)

      redirect "/restaurants/#{r.id}"
  end
  
end