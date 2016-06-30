require 'rails_helper'

RSpec.describe OfferReductionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/offer_reductions').to route_to('offer_reductions#index')
      expect(get: '/locations/1/offer_reductions').to route_to('offer_reductions#index', location_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/offer_reductions/new').not_to be_routable
      expect(get: '/locations/1/offer_reductions/new').to route_to('offer_reductions#new', location_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/offer_reductions/1').not_to be_routable
      expect(get: '/locations/1/offer_reductions/1').to route_to('offer_reductions#show', location_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/offer_reductions/1/edit').not_to be_routable
      expect(get: '/locations/1/offer_reductions/1/edit').to route_to('offer_reductions#edit', location_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/offer_reductions').not_to be_routable
      expect(post: '/locations/1/offer_reductions/').to route_to('offer_reductions#create', location_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/offer_reductions/1').not_to be_routable
      expect(put: '/locations/1/offer_reductions/1').to route_to('offer_reductions#update', location_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/offer_reductions/1').not_to be_routable
      expect(patch: '/locations/1/offer_reductions/1').to route_to('offer_reductions#update', location_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/offer_reductions/1').not_to be_routable
      expect(delete: '/locations/1/offer_reductions/1').to route_to('offer_reductions#destroy', location_id: '1', id: '1')
    end
  end
end
