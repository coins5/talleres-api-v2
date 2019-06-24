require './app/builders/AlumnoBuilder.rb'

RSpec.describe AlumnoBuilder do
  builder = AlumnoBuilder.new
  builder.set_codigo('C001')
  builder.set_nombre('Pepito')
  builder.set_apellido('apel')
  builder.set_email('pepito@company.com')
  builder.set_password('123456')
  alumno = builder.alumno
  
  describe "#builder" do
    it "returns C001 for codigo" do
      expect(alumno.codigo).to eq('C001')
    end
    it "returns Pepito for nombre" do
      expect(alumno.nombre).to eq('Pepito')
    end
    it "returns apel for apellido" do
      expect(alumno.apellido).to eq('apel')
    end
    it "returns pepito@company.com for email" do
      expect(alumno.email).to eq('pepito@company.com')
    end
    it "returns 123456 for password" do
      expect(alumno.password).to eq('123456')
    end
  end
end
