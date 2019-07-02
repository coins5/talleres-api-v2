require './app/controllers/PrimaryController'
require './app/builders/MatriculaBuilder'

class MatriculaController < PrimaryController
  VALID_TIPO_EVALUACION = ["eval1", "eval2", "evalfinal"]

  def createMatricula (body)
    builder = MatriculaBuilder.new
    builder.set_codigo_alumno(body['codigo_alumno'])
    builder.set_codigo_taller(body['codigo_taller'])  

    validateInteger!('codigo_alumno', builder.matricula.codigo_alumno)
    validateInteger!('codigo_taller', builder.matricula.codigo_taller)

    codigo_alumno = builder.matricula.codigo_alumno
    codigo_taller = builder.matricula.codigo_taller

    query = 'INSERT INTO Matricula (codigo_alumno, codigo_taller) VALUES ('
    query += "#{codigo_alumno}, #{codigo_taller});" 

    @client.query(query)
    return @client.affected_rows
  end

  def getMatricula (codigo_alumno, codigo_taller)
    validateInteger!('codigo_alumno', codigo_alumno)
    validateInteger!('codigo_taller', codigo_taller)

    query = "SELECT codigo_alumno, codigo_taller, eval1, eval2, evalFinal FROM Matricula "
    query += "WHERE codigo_alumno = #{codigo_alumno} AND codigo_taller = #{codigo_taller}"
    return queryToArray(query)
  end

  def setNota (codigo_alumno, codigo_taller, tipoEval, nota)
    validate_tipo_eval!(tipoEval)
    validateInteger!('codigo_alumno', codigo_alumno)
    validateInteger!('codigo_taller', codigo_taller)
    validateInteger!('nota', nota)

    query = "UPDATE Matricula SET #{tipoEval}=#{nota} "
    query += "WHERE codigo_alumno=#{codigo_alumno} AND codigo_taller=#{codigo_taller}"

    @client.query(query)
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