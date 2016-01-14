class PetsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @pets = Pet.all
  end

end
