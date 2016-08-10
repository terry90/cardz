require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  let(:valid_attributes) {
    attributes_for :location
  }

  let(:invalid_attributes) {
    {
        name: nil
    }
  }

  let(:valid_session) { {} }

  let(:card) { create(:card) }
  let(:user) { create(:user, cards: [card]) }
  let(:location) { create(:location) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all locations as @locations' do
      get :index, params: {}, session: valid_session
      expect(assigns(:locations)).to eq(Location.all)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested location as @location' do
      get :show, params: {id: location.to_param}, session: valid_session
      expect(assigns(:location)).to eq(location)
    end
  end

  describe 'GET #new' do
    it 'assigns a new location as @location' do
      get :new, params: {}, session: valid_session
      expect(assigns(:location)).to be_a_new(Location)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested location as @location' do
      get :edit, params: {id: location.to_param}, session: valid_session
      expect(assigns(:location)).to eq(location)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Location' do
        expect {
          post :create, params: {location: valid_attributes}, session: valid_session
        }.to change(Location, :count).by(1)
      end

      it 'assigns a newly created location as @location' do
        post :create, params: {location: valid_attributes}, session: valid_session
        expect(assigns(:location)).to be_a(Location)
        expect(assigns(:location)).to be_persisted
      end

      it 'redirects to the created location' do
        post :create, params: {location: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Location.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved location as @location' do
        post :create, params: {location: invalid_attributes}, session: valid_session
        expect(assigns(:location)).to be_a_new(Location)
      end

      it 're-renders the \'new\' template' do
        post :create, params: {location: invalid_attributes}, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
            name: 'New name zbra'
        }
      }

      it 'updates the requested location' do
        put :update, params: {id: location.to_param, location: new_attributes}, session: valid_session
        expect(location.reload.name).to eq new_attributes[:name]
      end

      it 'assigns the requested location as @location' do
        put :update, params: {id: location.to_param, location: valid_attributes}, session: valid_session
        expect(assigns(:location)).to eq(location)
      end

      it 'redirects to the location' do
        put :update, params: {id: location.to_param, location: valid_attributes}, session: valid_session
        expect(response).to redirect_to(location)
      end
    end

    context 'with invalid params' do
      it 'assigns the location as @location' do
        put :update, params: {id: location.to_param, location: invalid_attributes}, session: valid_session
        expect(assigns(:location)).to eq(location)
      end

      it 're-renders the \'edit\' template' do
        put :update, params: {id: location.to_param, location: invalid_attributes}, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:location) { create(:location) }

    it 'destroys the requested location' do
      expect {
        delete :destroy, params: {id: location.to_param}, session: valid_session
      }.to change(Location, :count).by(-1)
    end

    it 'redirects to the locations list' do
      delete :destroy, params: {id: location.to_param}, session: valid_session
      expect(response).to redirect_to(locations_url)
    end
  end
end
