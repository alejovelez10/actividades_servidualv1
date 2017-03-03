json.extract! seguimiento, :id, :user_id, :actividad_id, :descripcion, :porcentaje, :cierre, :anexo, :created_at, :updated_at
json.url seguimiento_url(seguimiento, format: :json)
