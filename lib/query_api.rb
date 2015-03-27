module QueryApi
  def query_api( artist_id = nil )
    oa_api_key = Rails.configuration.oa[:oa_api_key]
    request_url = "http://api.openaura.com/v1/particles/artists/#{artist_id}?id_type=oa%3Aartist_id&sort=date&api_key=#{oa_api_key}"
    JSON.parse(open(request_url).read, symbolize_names: true) unless artist_id.nil?
  end
end