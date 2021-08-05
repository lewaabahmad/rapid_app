json.extract! page, :id, :title, :description, :is_homepage, :is_dashboard, :requires_authentication, :header_html, :is_in_nav, :body_html, :url, :created_at, :updated_at
json.url page_url(page, format: :json)
