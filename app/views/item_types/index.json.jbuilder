json.array!(@supliers) do |suplier|
  json.extract! suplier, 
  json.url suplier_url(suplier, format: :json)
end
