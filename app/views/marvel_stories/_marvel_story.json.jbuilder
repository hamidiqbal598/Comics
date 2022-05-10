json.extract! marvel_story, :id, :description, :attribution_text, :created_at, :updated_at
json.url marvel_story_url(marvel_story, format: :json)
