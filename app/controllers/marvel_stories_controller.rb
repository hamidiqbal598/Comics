class MarvelStoriesController < ApplicationController


  def fetch_story

    if params[:story_id].present?
      @marvel_stories = MarvelStory.includes(:characters).find_by_real_id(params[:story_id])
      unless @marvel_stories.empty?
        @marvel_story = @marvel_stories.first
        @characters = @marvel_story.characters
      else
        response = MarvelStory.story_detail(params[:story_id])
        if response["code"] == 200 and response["status"] == "Ok"
          @marvel_story = MarvelStory.create(real_id: response["data"]["results"][0]["id"], attribution_text: response["attributionText"], description: response["data"]["results"][0]["description"], title: response["data"]["results"][0]["title"])
          response = MarvelStory.story_detail(params[:story_id]+"/characters")
          if response["code"] == 200 and response["status"] == "Ok"
            response_characters = response["data"]["results"]
            characters = []
            response_characters.each do |character|
              image = character["thumbnail"]["path"]
              extension = character["thumbnail"]["extension"]
              character = Character.create(name: character["name"], character_real_id: character["id"].to_i, character_description: character["description"], marvel_story_id: @marvel_story.id)
              character.picture.attach(io: open("#{image}.#{extension}"), filename: "picture.#{extension}", content_type: "image/#{extension}")
              characters << character
            end
            @characters = characters
          end
        else
          @error = response["message"]
        end
      end
    end

    if (params[:character_real_id].present?) and (params[:story_name].present?)
      @marvel_stories = MarvelStory.includes(:characters).where(characters: {character_real_id: params[:character_real_id] })
      unless @marvel_stories.empty?
        @marvel_story = @marvel_stories.first
        @characters = @marvel_story.characters
      else
        response = MarvelStory.list_character({}, "/#{params[:character_real_id]}/stories")
        if response["code"] == 200 and response["status"] == "Ok"
          stories = response["data"]["results"]
          stories.each do |story|
            if story["title"] == params[:story_name]
              story_id = story["id"]
              @marvel_story = MarvelStory.create(real_id: story_id, attribution_text: response["attributionText"], description: story["description"], title: params[:story_name])
              response = MarvelStory.story_detail(story_id.to_s+"/characters")
              if response["code"] == 200 and response["status"] == "Ok"
                response_characters = response["data"]["results"]
                characters = []
                response_characters.each do |character|
                  image = character["thumbnail"]["path"]
                  extension = character["thumbnail"]["extension"]
                  character = Character.create(name: character["name"], character_real_id: character["id"].to_i, character_description: character["description"], marvel_story_id: @marvel_story.id)
                  character.picture.attach(io: open("#{image}.#{extension}"), filename: "picture.#{extension}", content_type: "image/#{extension}")
                  characters << character
                end
                @characters = characters
              end
            end
          end
          @error = "No Marvel Story exist with this Title and Character"
        end
      end

    end

  end

  private
    def set_marvel_story
      @marvel_story = MarvelStory.find(params[:id])
    end

    def marvel_story_params
      params.require(:marvel_story).permit(:description, :attribution_text)
    end
end
