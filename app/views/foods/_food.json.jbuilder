json.extract! food, :id, :name, :description, :prefecture_id, :user_id, :img, :created_at, :updated_at
json.url food_url(food, format: :json)
