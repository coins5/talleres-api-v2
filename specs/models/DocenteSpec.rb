require './app/builders/DocenteBuilder.rb'

RSpec.describe DocenteBuilder do
  builder = DocenteBuilder.new
  builder.set_codigo('D001')
  builder.set_nombre('Luchito')
  builder.set_apellido('Apel Profe')
  builder.set_email('luchito@company.com')
  builder.set_password('654321')
  docente = builder.docente
  
  describe "#builder" do
    it "returns D001 for codigo" do
      expect(docente.codigo).to eq('D001')
    end
    it "returns Luchito for nombre" do
      expect(docente.nombre).to eq('Luchito')
    end
    it "returns Apel Profe for apellido" do
      expect(docente.apellido).to eq('Apel Profe')
    end
    it "returns luchito@company.com for email" do
      expect(docente.email).to eq('luchito@company.com')
    end
    it "returns 654321 for password" do
      expect(docente.password).to eq('654321')
    end
  end
end
