# Extrae o desmenuza el json de la base de dato
json.extract! article, :id, :title, :body, :created_at, :updated_at


# Es la url del json
json.url article_url(article, format: :json)