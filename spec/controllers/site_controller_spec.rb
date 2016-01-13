require 'rails_helper'

RSpec.describe SiteController, type: :controller do
  describe "GET #home" do
    it "render the home templace" do
      get :home
      expect(response).to render_template(:home)
    end
  end
end
