require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  describe 'routing' do
    context 'when not authenticated' do
      it 'routes to #index' do
        expect(get: '/cards').not_to be_routable
      end

      it 'routes to #new' do
        expect(get: '/cards/new').not_to be_routable
      end

      it 'routes to #show' do
        expect(get: '/cards/1').not_to be_routable
      end

      it 'routes to #edit' do
        expect(get: '/cards/1/edit').not_to be_routable
      end

      it 'routes to #create' do
        expect(post: '/cards').not_to be_routable
      end

      it 'routes to #update via PUT' do
        expect(put: '/cards/1').not_to be_routable
      end

      it 'routes to #update via PATCH' do
        expect(patch: '/cards/1').not_to be_routable
      end

      it 'routes to #destroy' do
        expect(delete: '/cards/1').not_to be_routable
      end
    end
  end
end
