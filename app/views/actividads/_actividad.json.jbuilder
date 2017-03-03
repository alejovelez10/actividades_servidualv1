json.extract! actividad, :id, :consecutivo, :tipo, :user_id, :prioridad, :responsable_id, :nombre, :descripcion, :anexo, :f_entrega, :porcentaje, :estado_envio, :contador, :codigo, :e_vencimiento, :created_at, :updated_at
json.url actividad_url(actividad, format: :json)
