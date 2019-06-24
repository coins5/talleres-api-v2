# https://ieftimov.com/post/refactoring-builder-pattern/
require './app/models/Student'

class StudentBuilder
  def initialize
    @student = Student.new    
  end

  def set_codigo (codigo)
    validate_presence!("Codigo", codigo)
    @student.codigo = codigo
  end

  def set_nombre (nombre)
    validate_presence!("Nombre", nombre)
    @student.nombre = nombre
  end

  def set_apellido (apellido)
    validate_presence!("Apellido", apellido)
    @student.apellido = apellido
  end

  def set_type (type)
    validate_presence!("Type", type)
    @student.type = type
  end

  def set_email (email)
    validate_presence!("Email", email)
    @student.email = email
  end

  def set_password (password)
    validate_presence!("Password", password)
    @student.password = password
  end

  def student
    @student
  end

  private

  def validate_presence!(attr_name, attr_value)
    raise "#{attr_name} es obligatorio." if attr_value.nil?
  end

end
