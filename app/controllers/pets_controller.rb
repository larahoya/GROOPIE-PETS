class PetsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @user = current_user
    @pets = Pet.all
  end

  def new
    @user = current_user
    @pet = current_user.pets.new
  end

  def create
    @user = current_user
    @pet = current_user.pets.new(pet_params)
    if @pet.save
      flash[:notice] = 'You have a new pet!'
      redirect_to action: 'profile', controller: 'users'
    else
      flash[:alert] = "Pet couldn't be created"
      @errors = @pet.errors.full_messages
      render 'new'
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :age, :avatar)
  end

end
