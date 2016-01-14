class PetsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

end
