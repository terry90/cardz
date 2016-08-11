require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  let(:valid_attributes) {
    attributes_for :business
  }

  let(:invalid_attributes) {
    {
        name: nil
    }
  }

  let(:valid_session) { {} }

  let(:user) { create(:user) }

  let(:business) { create(:business) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all businesses as @businesses' do
      get :index, params: {}, session: valid_session
      expect(assigns(:businesses)).to eq(Business.all)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested business as @business' do
      get :show, params: {id: business.to_param}, session: valid_session
      expect(assigns(:business)).to eq(business)
    end
  end

  describe 'GET #new' do
    it 'assigns a new business as @business' do
      get :new, params: {}, session: valid_session
      expect(assigns(:business)).to be_a_new(Business)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested business as @business' do
      get :edit, params: {id: business.to_param}, session: valid_session
      expect(assigns(:business)).to eq(business)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Business' do
        expect {
          post :create, params: {business: valid_attributes}, session: valid_session
        }.to change(Business, :count).by(1)
      end

      it 'assigns a newly created business as @business' do
        post :create, params: {business: valid_attributes}, session: valid_session
        expect(assigns(:business)).to be_a(Business)
        expect(assigns(:business)).to be_persisted
      end

      it 'redirects to the created business' do
        post :create, params: {business: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Business.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved business as @business' do
        post :create, params: {business: invalid_attributes}, session: valid_session
        expect(assigns(:business)).to be_a_new(Business)
      end

      it 're-renders the \'new\' template' do
        post :create, params: {business: invalid_attributes}, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
            name: 'New business name'
        }
      }

      it 'updates the requested business' do
        put :update, params: {id: business.to_param, business: new_attributes}, session: valid_session
        expect(business.reload.name).to eq new_attributes[:name]
      end

      it 'assigns the requested business as @business' do
        put :update, params: {id: business.to_param, business: valid_attributes}, session: valid_session
        expect(assigns(:business)).to eq(business)
      end

      it 'redirects to the business' do
        put :update, params: {id: business.to_param, business: valid_attributes}, session: valid_session
        expect(response).to redirect_to(business)
      end
    end

    context 'with invalid params' do
      it 'assigns the business as @business' do
        put :update, params: {id: business.to_param, business: invalid_attributes}, session: valid_session
        expect(assigns(:business)).to eq(business)
      end

      it 're-renders the \'edit\' template' do
        put :update, params: {id: business.to_param, business: invalid_attributes}, session: valid_session
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:business) { create(:business) }

    it 'destroys the requested business' do
      expect {
        delete :destroy, params: {id: business.to_param}, session: valid_session
      }.to change(Business, :count).by(-1)
    end

    it 'redirects to the businesses list' do
      delete :destroy, params: {id: business.to_param}, session: valid_session
      expect(response).to redirect_to(businesses_url)
    end
  end

end
