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
  
 # binding.pry
    binding.pry
  if !params["pet"]["owner_id"].empty?
      @pets << Owner.create(params["owner"])
    end 
    redirect to "pets/#{@pets.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
   # binding.pry
    erb :'/pets/show'
  end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end