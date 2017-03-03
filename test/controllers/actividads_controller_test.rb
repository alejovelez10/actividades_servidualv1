require 'test_helper'

class ActividadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actividad = actividads(:one)
  end

  test "should get index" do
    get actividads_url
    assert_response :success
  end

  test "should get new" do
    get new_actividad_url
    assert_response :success
  end

  test "should create actividad" do
    assert_difference('Actividad.count') do
      post actividads_url, params: { actividad: { anexo: @actividad.anexo, codigo: @actividad.codigo, consecutivo: @actividad.consecutivo, contador: @actividad.contador, descripcion: @actividad.descripcion, e_vencimiento: @actividad.e_vencimiento, estado_envio: @actividad.estado_envio, f_entrega: @actividad.f_entrega, nombre: @actividad.nombre, porcentaje: @actividad.porcentaje, prioridad: @actividad.prioridad, responsable_id: @actividad.responsable_id, tipo: @actividad.tipo, user_id: @actividad.user_id } }
    end

    assert_redirected_to actividad_url(Actividad.last)
  end

  test "should show actividad" do
    get actividad_url(@actividad)
    assert_response :success
  end

  test "should get edit" do
    get edit_actividad_url(@actividad)
    assert_response :success
  end

  test "should update actividad" do
    patch actividad_url(@actividad), params: { actividad: { anexo: @actividad.anexo, codigo: @actividad.codigo, consecutivo: @actividad.consecutivo, contador: @actividad.contador, descripcion: @actividad.descripcion, e_vencimiento: @actividad.e_vencimiento, estado_envio: @actividad.estado_envio, f_entrega: @actividad.f_entrega, nombre: @actividad.nombre, porcentaje: @actividad.porcentaje, prioridad: @actividad.prioridad, responsable_id: @actividad.responsable_id, tipo: @actividad.tipo, user_id: @actividad.user_id } }
    assert_redirected_to actividad_url(@actividad)
  end

  test "should destroy actividad" do
    assert_difference('Actividad.count', -1) do
      delete actividad_url(@actividad)
    end

    assert_redirected_to actividads_url
  end
end
