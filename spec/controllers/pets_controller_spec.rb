require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  
  describe '#index' do
    it 'render the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'respond with a 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe '#new' do
    before (:each) do
      sign_in FactoryGirl.create(:user)
    end
    it 'render the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'respond with a 200 status code' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
  
    context 'all the information is correct' do
      before (:each) do
        @user = FactoryGirl.create(:user)
        @count = Pet.all.count
        @pet = FactoryGirl.build(:pet)
        sign_in @user
        post :create, {pet: {name: @pet.name, species: @pet.species, age: @pet.age}}
      end
      it 'creates a new pet' do
        expect(Pet.all.count).to eq(@count +1)
      end
      it 'creates a new pet that belongs to the current user' do
        expect(Pet.last.user_id).to eq(@user.id)
      end
    end

    context 'some information is missing or incorrect' do
      before (:each) do
        @user = FactoryGirl.create(:user)
        @count = Pet.all.count
        @pet = FactoryGirl.build(:pet, name: nil)
        sign_in @user
        post :create, {pet: {name: @pet.name, species: @pet.species, age: @pet.age}}
      end
      it 'does not create a new pet' do
        expect(Pet.all.count).to eq(@count)
      end
      it 'render the new template' do
        expect(response).to render_template(:new)
      end
    end
  end

end
