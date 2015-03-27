# This adds a property to the Rails configuration to be able to access the hidden OpenAura API key as an ENV variable 
Rails.configuration.oa = {
  :oa_api_key => ENV['OA_API_KEY']
}
