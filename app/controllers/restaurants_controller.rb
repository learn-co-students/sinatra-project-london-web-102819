class RestaurantsController < ApplicationController
    
  get '/restaurants' do
    @restaurants = Restaurant.all.order(:name)
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

  post '/restaurants/search' do
      
      #array of restaurants where each element is [restaurant name, restaurant rating, restaurant address]
      @restaurants = restaurant_search(params[:location], params[:cuisine])
      @restaurants.each {|r| Restaurant.create(name: r[0], rating: r[1], address: r[2])}
      
      redirect '/restaurants'
  end

  
end