require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe '#profile' do
    before (:each) do
      sign_in FactoryGirl.create(:user)
    end
    it 'render the profile template' do
      get :profile
      expect(response).to render_template(:profile)
    end

    it 'respond with a 200 status code' do
      get :profile
      expect(response).to have_http_status(200)
    end
  end

end
