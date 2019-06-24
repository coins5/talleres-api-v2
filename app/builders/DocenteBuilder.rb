require './app/models/Docente'

class DocenteBuilder
  attr_reader :docente

  def initialize
    @docente = Docente.new    
  end

  def set_codigo (codigo)
    validate_presence!("Codigo", codigo)
    @docente.codigo = codigo
  end

  def set_nombre (nombre)
    validate_presence!("Nombre", nombre)
    @docente.nombre = nombre
  end

  def set_apellido (apellido)
    validate_presence!("Apellido", apellido)
    @docente.apellido = apellido
  end

  def set_email (email)
    validate_presence!("Email", email)
    @docente.email = email
  end

  def set_password (password)
    validate_presence!("Password", password)
    @docente.password = password
  end

  private

  def validate_presence!(attr_name, attr_value)
    raise "#{attr_name} es obligatorio." if attr_value.nil?
  end

end