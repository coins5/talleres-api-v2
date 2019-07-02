
attr_name = 'PRUEBA'
attr_value = 1
raise "#{attr_name} debe ser integer. Valor encontrado: #{attr_value}" unless (attr_value.is_a? Integer)

puts ENV['MYSQL_ROOT_PASSWORD'] || '123456'
