module QueryApi
  # This is the helper method used in the Particle model to get the collection from the OpenAura API using my personal key, with the key set as an ENV variable on my local machine and on Heroku (see config/initializers/oa.rb
  def query_api( artist_id = nil )
    oa_api_key = Rails.configuration.oa[:oa_api_key]
    request_url = "http://api.openaura.com/v1/particles/artists/#{artist_id}?id_type=oa%3Aartist_id&sort=date&api_key=#{oa_api_key}"
    JSON.parse(open(request_url).read, symbolize_names: true) unless artist_id.nil?
  end
end