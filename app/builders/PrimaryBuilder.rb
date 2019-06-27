class PrimaryBuilder
  VALID_TIPO_TALLER = ["teorico", "practico", "blended"]
  
  private

  def validate_presence!(attr_name, attr_value)
    raise "#{attr_name} es obligatorio." if attr_value.nil?
  end

  def validate_tipo_taller!(tipoTaller)
    oTipoTaller = tipoTaller.downcase
    unless VALID_TIPO_TALLER.include?(oTipoTaller)
      raise "Tipo de taller inválido: #{oTipoTaller}"
    end
  end

end