require './app/builders/TallerBuilder.rb'

RSpec.describe TallerBuilder do
  builder = TallerBuilder.new
  builder.set_codigo('T001')
  builder.set_nombre('Taller 1')
  builder.set_tipoTaller('blended')
  builder.set_codigo_docente('D001')
  taller = builder.taller
  
  describe "#builder" do
    it "returns T001 for codigo" do
      expect(taller.codigo).to eq('T001')
    end
    it "returns Taller 1 for nombre" do
      expect(taller.nombre).to eq('Taller 1')
    end
    it "returns blended for tipoTaller" do
      expect(taller.tipoTaller).to eq('blended')
    end
    it "returns D001 for set_codigo_docente" do
      expect(taller.codigo_docente).to eq('D001')
    end
  end
end
