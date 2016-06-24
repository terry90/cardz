json.array!(@offer_reductions) do |offer_reduction|
  json.extract! offer_reduction, :id, :name, :percent, :uid, :location_id, :description, :title
  json.url offer_reduction_url(offer_reduction, format: :json)
end
