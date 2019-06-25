require './app/builders/MatriculaBuilder.rb'

RSpec.describe MatriculaBuilder do
  builder = MatriculaBuilder.new

  builder.set_codigo_alumno('C001')
  builder.set_codigo_taller('T001')
  builder.set_eval1(15.25)
  builder.set_eval2(14.23)
  builder.set_evalFinal(19.23)
  matricula = builder.matricula
  
  describe "#builder" do
    it "returns C001 for codigo_alumno" do
      expect(matricula.codigo_alumno).to eq('C001')
    end
    it "returns T001 for codigo_taller" do
      expect(matricula.codigo_taller).to eq('T001')
    end
    it "returns 15.25 for eval1" do
      expect(matricula.eval1).to eq(15.25)
    end
    it "returns 14.23 for eval2" do
      expect(matricula.eval2).to eq(14.23)
    end
    it "returns 19.23 for evalFinal" do
      expect(matricula.evalFinal).to eq(19.23)
    end
  end
end
