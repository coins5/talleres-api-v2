require './app/controllers/PrimaryController'
require './app/builders/MatriculaBuilder'

class MatriculaController < PrimaryController
  VALID_TIPO_EVALUACION = ["eval1", "eval2", "evalvirtual", "evalfinal"]

  def createMatricula (body)
    builder = MatriculaBuilder.new
    builder.set_codigo_alumno(body['codigo_alumno'])
    builder.set_codigo_taller(body['codigo_taller'])  

    validateInteger!('codigo_alumno', builder.matricula.codigo_alumno)
    validateInteger!('codigo_taller', builder.matricula.codigo_taller)

    codigo_alumno = builder.matricula.codigo_alumno
    codigo_taller = builder.matricula.codigo_taller

    query = 'INSERT INTO Matricula (codigo_alumno, codigo_taller) VALUES (?, ?)'
    statement = @client.prepare(query)
    results = statement.execute(codigo_alumno, codigo_taller)
    return @client.affected_rows
  end

  def getMatricula (codigo_alumno, codigo_taller)
    validateInteger!('codigo_alumno', codigo_alumno)
    validateInteger!('codigo_taller', codigo_taller)

    query = 'SELECT codigo_alumno, codigo_taller, eval1, eval2, evalVirtual, evalFinal FROM Matricula '
    query += 'WHERE codigo_alumno = ? AND codigo_taller = ?'
    statement = @client.prepare(query)
    results = statement.execute(codigo_alumno, codigo_taller)
    return resultToArray(results)
  end

  def setNota (codigo_alumno, codigo_taller, tipoEval, nota)
    validate_tipo_eval!(tipoEval)
    validateInteger!('codigo_alumno', codigo_alumno)
    validateInteger!('codigo_taller', codigo_taller)
    validateDecimal!('nota', nota)

    query = "UPDATE Matricula SET #{tipoEval}=? "
    query += 'WHERE codigo_alumno=? AND codigo_taller=?'
    statement = @client.prepare(query)
    results = statement.execute(nota, codigo_alumno, codigo_taller)
    return @client.affected_rows
  end

private

  def validate_tipo_eval!(tipoEval)
    otipoEval = tipoEval.downcase
    unless VALID_TIPO_EVALUACION.include?(otipoEval)
      raise "Tipo de evaluacion inválido: #{otipoEval}"
    end
  end
end