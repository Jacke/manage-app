json.array!(@nexuses) do |nexuse|
  json.extract! nexuse, 
  json.url nexuse_url(nexuse, format: :json)
end
