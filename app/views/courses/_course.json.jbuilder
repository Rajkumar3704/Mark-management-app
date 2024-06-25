json.extract! course, :id, :couse_title, :description, :course_code, :credits, :created_at, :updated_at
json.url course_url(course, format: :json)
