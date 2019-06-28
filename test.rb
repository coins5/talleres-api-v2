
attr_name = 'PRUEBA'
attr_value = 'A'
raise "#{attr_name} debe ser integer. Valor encontrado: #{attr_value}" unless (attr_value.is_a? Integer)
