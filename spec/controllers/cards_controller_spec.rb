require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  let(:valid_attributes) {
    attributes_for :card
  }

  let(:invalid_attributes) {
    {
        uid: nil
    }
  }

  let(:valid_session) { {} }

  let!(:card) { create(:card) }

  describe 'GET #index' do
    it 'assigns all cards as @cards' do
      get :index, params: {}, session: valid_session
      expect(assigns(:cards)).to eq([card])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested card as @card' do
      get :show, params: {id: card.to_param}, session: valid_session
      expect(assigns(:card)).to eq(card)
    end
  end

  describe 'GET #new' do
    it 'assigns a new card as @card' do
      get :new, params: {}, session: valid_session
      expect(assigns(:card)).to be_a_new(Card)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested card as @card' do
      get :edit, params: {id: card.to_param}, session: valid_session
      expect(assigns(:card)).to eq(card)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Card' do
        expect {
          post :create, params: {card: valid_attributes}, session: valid_session
        }.to change(Card, :count).by(1)
      end

      it 'assigns a newly created card as @card' do
        post :create, params: {card: valid_attributes}, session: valid_session
        expect(assigns(:card)).to be_a(Card)
        expect(assigns(:card)).to be_persisted
      end

      it 'redirects to the created card' do
        post :create, params: {card: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Card.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved card as @card' do
        post :create, params: {card: invalid_attributes}, session: valid_session
        expect(assigns(:card)).to be_a_new(Card)
      end

      it 're-renders the \'new\' template' do
        post :create, params: {card: invalid_attributes}, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        attributes_for(:card).merge(uid: 'UI8DZ2')
      }

      it 'updates the requested card' do
        put :update, params: {id: card.to_param, card: new_attributes}, session: valid_session
        card.reload
        expect(card.uid).to eq new_attributes[:uid]
      end

      it 'assigns the requested card as @card' do
        put :update, params: {id: card.to_param, card: valid_attributes}, session: valid_session
        expect(assigns(:card)).to eq(card)
      end

      it 'redirects to the card' do
        put :update, params: {id: card.to_param, card: valid_attributes}, session: valid_session
        expect(response).to redirect_to(card)
      end
    end

    context 'with invalid params' do
      it 'assigns the card as @card' do
        put :update, params: {id: card.to_param, card: invalid_attributes}, session: valid_session
        expect(assigns(:card)).to eq(card)
      end

      it 're-renders the \'edit\' template' do
        put :update, params: {id: card.to_param, card: invalid_attributes}, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested card' do
      expect {
        delete :destroy, params: {id: card.to_param}, session: valid_session
      }.to change(Card, :count).by(-1)
    end

    it 'redirects to the cards list' do
      delete :destroy, params: {id: card.to_param}, session: valid_session
      expect(response).to redirect_to(cards_url)
    end
  end
end
