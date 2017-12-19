json.extract! question, :id, :content, :yes, :no, :unsure, :comments, :user_id, :created_at, :updated_at
json.url question_url(question, format: :json)
