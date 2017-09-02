class FiguresController < ApplicationController
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
  #  binding.pry
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @title = Title.all.find {|t| t.name == params["title"]["name"]}
		if !params["title"].empty? && !@title
		 	@figure.titles << Title.create(name: params["title"]["name"])
		end
    @landmark = Landmark.all.find {|l| l.name == params["landmark"]["name"]}
    if !params["landmark"].empty? && !@landmark
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
		@figure.save
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    get "/figures/#{@figure.id}"
  end

end
