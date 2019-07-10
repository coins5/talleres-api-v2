require './app/models/Matricula'
require './app/builders/PrimaryBuilder'

class MatriculaBuilder < PrimaryBuilder
  attr_reader :matricula

  def initialize
    @matricula = Matricula.new    
  end

  def set_codigo_alumno (codigo_alumno)
    validate_presence!("codigo_alumno", codigo_alumno)
    @matricula.codigo_alumno = codigo_alumno
  end

  def set_codigo_taller (codigo_taller)
    validate_presence!("codigo_taller", codigo_taller)
    @matricula.codigo_taller = codigo_taller
  end

  def set_eval1 (eval1)
    #validate_presence!("eval1", eval1)
    @matricula.eval1 = eval1
  end

  def set_eval2 (eval2)
    #validate_presence!("eval2", eval2)
    @matricula.eval2 = eval2
  end

  def set_evalVirtual (evalVirtual)
    #validate_presence!("eval2", eval2)
    @matricula.evalVirtual = evalVirtual
  end

  def set_evalFinal (evalFinal)
    #validate_presence!("evalFinal", evalFinal)
    @matricula.evalFinal = evalFinal
  end
end
