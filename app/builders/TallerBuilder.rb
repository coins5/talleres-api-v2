require './app/models/Taller'
require './app/builders/PrimaryBuilder'

class TallerBuilder < PrimaryBuilder
  attr_reader :taller

  def initialize
    @taller = Taller.new    
  end

  def set_codigo (codigo)
    validate_presence!("Codigo", codigo)
    @taller.codigo = codigo
  end

  def set_nombre (nombre)
    validate_presence!("Nombre", nombre)
    @taller.nombre = nombre
  end

  def set_tipoTaller (tipoTaller)
    validate_presence!("tipoTaller", tipoTaller)
    validate_tipo_taller!(tipoTaller)
    @taller.tipoTaller = tipoTaller
  end

  def set_codigo_docente (codigo_docente)
    validate_presence!("codigo_docente", codigo_docente)
    @taller.codigo_docente = codigo_docente
  end

end