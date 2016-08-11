require 'rails_helper'

RSpec.describe OfferReductionsController, type: :controller do
  let(:valid_attributes) {
    attributes_for :offer_reduction
  }

  let(:invalid_attributes) {
    {
        name: nil
    }
  }

  let(:valid_session) { {} }

  let(:user) { create(:user) }

  let(:offer_reduction) { create(:offer_reduction) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all offer_reductions as @offer_reductions' do
      get :index, params: {}, session: valid_session
      expect(assigns(:offer_reductions)).to eq(OfferReduction.all)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested offer_reduction as @offer_reduction' do
      get :show, params: {id: offer_reduction.to_param}, session: valid_session
      expect(assigns(:offer_reduction)).to eq(offer_reduction)
    end
  end

  describe 'GET #new' do
    it 'assigns a new offer_reduction as @offer_reduction' do
      get :new, params: {}, session: valid_session
      expect(assigns(:offer_reduction)).to be_a_new(OfferReduction)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested offer_reduction as @offer_reduction' do
      get :edit, params: {id: offer_reduction.to_param}, session: valid_session
      expect(assigns(:offer_reduction)).to eq(offer_reduction)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new OfferReduction' do
        expect {
          post :create, params: {offer_reduction: valid_attributes}, session: valid_session
        }.to change(OfferReduction, :count).by(1)
      end

      it 'assigns a newly created offer_reduction as @offer_reduction' do
        post :create, params: {offer_reduction: valid_attributes}, session: valid_session
        expect(assigns(:offer_reduction)).to be_a(OfferReduction)
        expect(assigns(:offer_reduction)).to be_persisted
      end

      it 'redirects to the created offer_reduction' do
        post :create, params: {offer_reduction: valid_attributes}, session: valid_session
        expect(response).to redirect_to(OfferReduction.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved offer_reduction as @offer_reduction' do
        post :create, params: {offer_reduction: invalid_attributes}, session: valid_session
        expect(assigns(:offer_reduction)).to be_a_new(OfferReduction)
      end

      it 're-renders the \'new\' template' do
        post :create, params: {offer_reduction: invalid_attributes}, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
            name: '30% off'
        }
      }

      it 'updates the requested offer_reduction' do
        put :update, params: {id: offer_reduction.to_param, offer_reduction: new_attributes}, session: valid_session
        offer_reduction.reload
        expect(offer_reduction.reload.name).to eq new_attributes[:name]
      end

      it 'assigns the requested offer_reduction as @offer_reduction' do
        put :update, params: {id: offer_reduction.to_param, offer_reduction: valid_attributes}, session: valid_session
        expect(assigns(:offer_reduction)).to eq(offer_reduction)
      end

      it 'redirects to the offer_reduction' do
        put :update, params: {id: offer_reduction.to_param, offer_reduction: valid_attributes}, session: valid_session
        expect(response).to redirect_to(offer_reduction)
      end
    end

    context 'with invalid params' do
      it 'assigns the offer_reduction as @offer_reduction' do
        put :update, params: {id: offer_reduction.to_param, offer_reduction: invalid_attributes}, session: valid_session
        expect(assigns(:offer_reduction)).to eq(offer_reduction)
      end

      it 're-renders the \'edit\' template' do
        put :update, params: {id: offer_reduction.to_param, offer_reduction: invalid_attributes}, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:offer_reduction) { create(:offer_reduction) }

    it 'destroys the requested offer_reduction' do
      expect {
        delete :destroy, params: {id: offer_reduction.to_param}, session: valid_session
      }.to change(OfferReduction, :count).by(-1)
    end

    it 'redirects to the offer_reductions list' do
      delete :destroy, params: {id: offer_reduction.to_param}, session: valid_session
      expect(response).to redirect_to(offer_reductions_url)
    end
  end

end
