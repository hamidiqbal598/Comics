class MarvelCharacter

  include HTTParty

  def self.base_url
    'https://gateway.marvel.com:443/v1/public/characters'
  end

  PUBLIC_KEY = "c700ccbdcb18a80ccbc8327e00e0897a"
  PRIVATE_KEY = "2a6804298a974c3d497a387c44f1e276268a1e57"


  def self.getting_characters()
    require 'digest'
    md5 = Digest::MD5.new
    md5.update (DateTime.now() + PRIVATE_KEY + PUBLIC_KEY)
    params = {ts: DateTime.now(), apikey: PUBLIC_KEY, hash: md5.hexdigest}
    begin
      response = get("#{base_url}?#{params.to_query}").parsed_response
      if response.include?('Success')
        puts response
        true
      else
        false
      end
    rescue
      false
    end
  end

end

