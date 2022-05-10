class MarvelStory < ApplicationRecord

  has_many :characters

  scope :find_by_real_id, -> (real_id) { where(real_id: real_id) }

  include HTTParty

  def self.base_url
    'https://gateway.marvel.com:443/v1/public/'
  end

  PUBLIC_KEY = "c700ccbdcb18a80ccbc8327e00e0897a"
  PRIVATE_KEY = "2a6804298a974c3d497a387c44f1e276268a1e57"

  def self.list_character(further_param, further_id = "")
    begin
      require 'digest'
      md5 = Digest::MD5.new
      date_time = DateTime.now().to_s
      md5.update (date_time + PRIVATE_KEY + PUBLIC_KEY)
      params = {ts: date_time, apikey: PUBLIC_KEY, hash: md5.hexdigest, limit: 100}
      params.merge!(further_param)
      request = "#{base_url}characters#{further_id}?#{params.to_query}"
      response = get(request, format: :json)
      if response["code"] != 200
        response = { "code" => 404, "status" => "Notok", "message" => "This character is not present in Marvel List", "data" => []}
      end
      response
    rescue
      response = { "code" => 501, "status" => "Notok", "message" => "Api Request Failed", "data" => [] }
      response
    end
  end

  def self.story_detail(story_id)
    begin
      require 'digest'
      md5 = Digest::MD5.new
      date_time = DateTime.now().to_s
      md5.update (date_time + PRIVATE_KEY + PUBLIC_KEY)
      params = {ts: date_time, apikey: PUBLIC_KEY, hash: md5.hexdigest, limit: 100}
      request = "#{base_url}stories/#{story_id}?#{params.to_query}"
      response = get(request, format: :json)
      if response["code"] != 200
        response = { "code" => 404, "status" => "Notok", "message" => "This story is not present in Marvel List", "data" => []}
      end
      response
    rescue
      response = { "code" => 501, "status" => "Notok", "message" => "Api Request Failed", "data" => [] }
      response
    end
  end

end
