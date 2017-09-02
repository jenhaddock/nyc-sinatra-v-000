class LandmarksController < ApplicationController
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    if @landmark == nil
      @landmark = Landmark.find(params[:id])
    end
    erb :'/landmarks/show'
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params["landmark"])
    get "/figures/#{@figure.id}"
  end

end
