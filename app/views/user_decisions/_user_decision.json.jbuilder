json.extract! user_decision, :id, :gender, :age, :educational_level, :martial_status, :professional_area, :family_size, :created_at, :updated_at
json.url user_decision_url(user_decision, format: :json)
