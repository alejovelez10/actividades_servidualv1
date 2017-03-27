json.extract! document, :id, :obra, :user_id, :document_date, :anexo, :document_type_id, :sub_document_type_id, :description, :created_at, :updated_at
json.url document_url(document, format: :json)
