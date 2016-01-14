class UsersController < ApplicationController

  def profile
    @user = current_user
    @pets = @user.pets
  end
  
end
