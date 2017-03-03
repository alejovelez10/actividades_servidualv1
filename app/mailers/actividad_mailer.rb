class ActividadMailer < ApplicationMailer
	

def vencimiento(user,actividad,tipo)
  @user = user
  @actividad = actividad
  @tipo =tipo
  mail(to: @user.email, subject: "Alerta de Actividad")
end

def creacion(user,actividad)
  @user = user
  @actividad = actividad

  mail(to: @user.email, subject: "Alerta de Actividad")
end

def seguimiento(user,actividad)
  @user = user 
  @actividad = actividad
  
  mail(to: @user.email, subject: "Alerta de Actividad")
end

def invitado(user,actividad)
  @user = user 
  @actividad = actividad
  
  mail(to: @user.email, subject: "Alerta de Actividad")
end
end
