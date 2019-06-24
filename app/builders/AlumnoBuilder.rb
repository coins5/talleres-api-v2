# https://ieftimov.com/post/refactoring-builder-pattern/
require './app/models/Alumno'

class AlumnoBuilder
  attr_reader :alumno

  def initialize
    @alumno = Alumno.new    
  end

  def set_codigo (codigo)
    validate_presence!("Codigo", codigo)
    @alumno.codigo = codigo
  end

  def set_nombre (nombre)
    validate_presence!("Nombre", nombre)
    @alumno.nombre = nombre
  end

  def set_apellido (apellido)
    validate_presence!("Apellido", apellido)
    @alumno.apellido = apellido
  end

  def set_email (email)
    validate_presence!("Email", email)
    @alumno.email = email
  end

  def set_password (password)
    validate_presence!("Password", password)
    @alumno.password = password
  end

  private

  def validate_presence!(attr_name, attr_value)
    raise "#{attr_name} es obligatorio." if attr_value.nil?
  end

end
