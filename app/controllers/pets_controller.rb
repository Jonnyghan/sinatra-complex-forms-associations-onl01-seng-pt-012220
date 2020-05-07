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
  if @pets.owner_id == nil
      @pets.owner_id = @owner.id 
      @pets.save
    end 
    #binding.pry
    redirect to "pets/#{@pets.id}"
  end

get '/pets/:id/edit' do 
    @owner = Owner.find_by_id(@pets.owner.id)
    @pets = Pet.find(params[:id])
    erb :'/pets/edit'
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