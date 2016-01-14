class PetsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

end
