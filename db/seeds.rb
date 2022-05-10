
def creating_characters(offset)
  further_param = {offset: offset}
  response = MarvelStory.list_character(further_param)
  if response["code"] == 200 and response["status"] == "Ok"
    characters = response["data"]["results"]
    characters.each do |character|
      Character.create(name: character["name"], character_real_id: character["id"].to_i, character_description: character["description"])
    end
    puts offset
    offset = offset + 100
    if offset < response["data"]["total"]
      creating_characters(offset)
    end
  end
end

puts "Creating Characters for filter"
creating_characters(0)
puts "Done with characters creation"