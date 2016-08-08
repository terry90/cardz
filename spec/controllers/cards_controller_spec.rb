require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe CardsController, type: :controller do

  # before { skip 'Code me maybe' }

  # This should return the minimal set of attributes required to create a valid
  # Card. As you add validations to Card, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for :card
  }

  let(:invalid_attributes) {
    {
        uid: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all cards as @cards' do
      Card.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:cards)).to eq(Card.all)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested card as @card' do
      card = Card.create! valid_attributes
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
      card = Card.create! valid_attributes
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
        card = Card.create! valid_attributes
        put :update, params: {id: card.to_param, card: new_attributes}, session: valid_session
        card.reload
        expect(card.uid).to eq new_attributes[:uid]
      end

      it 'assigns the requested card as @card' do
        card = Card.create! valid_attributes
        put :update, params: {id: card.to_param, card: valid_attributes}, session: valid_session
        expect(assigns(:card)).to eq(card)
      end

      it 'redirects to the card' do
        card = Card.create! valid_attributes
        put :update, params: {id: card.to_param, card: valid_attributes}, session: valid_session
        expect(response).to redirect_to(card)
      end
    end

    context 'with invalid params' do
      it 'assigns the card as @card' do
        card = Card.create! valid_attributes
        put :update, params: {id: card.to_param, card: invalid_attributes}, session: valid_session
        expect(assigns(:card)).to eq(card)
      end

      it 're-renders the \'edit\' template' do
        card = Card.create! valid_attributes
        put :update, params: {id: card.to_param, card: invalid_attributes}, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested card' do
      card = Card.create! valid_attributes
      expect {
        delete :destroy, params: {id: card.to_param}, session: valid_session
      }.to change(Card, :count).by(-1)
    end

    it 'redirects to the cards list' do
      card = Card.create! valid_attributes
      delete :destroy, params: {id: card.to_param}, session: valid_session
      expect(response).to redirect_to(cards_url)
    end
  end
end
