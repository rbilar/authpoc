json.extract! invoice, :id, :client_id, :product_id, :discount, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
