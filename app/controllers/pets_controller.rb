 class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners= Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
  @pets = Pet.create(params[:pet])
  @owner= Owner.create(params[:owner])
  binding.pry
  if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end 
    redirect to "pets/#{@pets.id}"
  end

  get '/pets/:id' do 
   # binding.pry
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end