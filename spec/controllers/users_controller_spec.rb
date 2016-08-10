require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    attributes_for :user
  }

  let(:invalid_attributes) {
    {
        email: 'ga'
    }
  }

  let(:cards_attributes) {
    {
        cards_attributes: {
            '0': {
                uid: card.uid,
                _destroy: false
            }
        }
    }
  }

  let(:valid_session) { {} }

  let(:card) { create(:card) }
  let(:user) { create(:user, cards: [card]) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all users as @users', js: true do
      get :index, params: {}, session: valid_session
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user as @user' do
      get :show, params: {id: user.to_param}, session: valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #new' do
    it 'assigns a new user as @user' do
      get :new, params: {}, session: valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested user as @user' do
      get :edit, params: {id: user.to_param}, session: valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) {
      attributes_for(:user).merge(cards_attributes)
    }

    context 'with valid params' do
      it 'creates a new User' do
        expect {
          post :create, params: {user: valid_attributes}, session: valid_session
        }.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, params: {user: valid_attributes}, session: valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'redirects to the created user' do
        post :create, params: {user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(User.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, params: {user: invalid_attributes}, session: valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it 're-renders the \'new\' template' do
        post :create, params: {user: invalid_attributes}, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
            first_name: 'Zbra',
            last_name: 'Zbre'
        }
      }

      it 'updates the requested user' do
        put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
        user.reload
        expect(user.first_name).to eq new_attributes[:first_name]
        expect(user.last_name).to eq new_attributes[:last_name]
      end

      it 'assigns the requested user as @user' do
        put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
        expect(assigns(:user)).to eq(user)
      end

      it 'redirects to the user' do
        put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(user)
      end
    end

    context 'with invalid params' do
      it 'assigns the user as @user' do
        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(assigns(:user)).to eq(user)
      end

      it 're-renders the \'edit\' template' do
        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      expect {
        delete :destroy, params: {id: user.to_param}, session: valid_session
      }.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      delete :destroy, params: {id: user.to_param}, session: valid_session
      expect(response).to redirect_to(users_url)
    end
  end

end
