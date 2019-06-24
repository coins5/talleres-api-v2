require './app/models/Student.rb'

RSpec.describe Student do
  describe "#nota" do
    it "returns 20 for nota" do
      student = Student.new("C001", "NOMBRE", "APELLIDO")
      student.setNota(20)
      expect(student.nota).to eq(19)
      expect(student.nota).to eq(20)
    end
  end
end
