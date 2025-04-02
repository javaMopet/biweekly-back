class TestMailer < ApplicationMailer
  # main
  def test_email
    mail(to: "horaciopenamendoza@gmail.com", subject: "Correo de Prueba", body: "Este es un correo de prueba.")
  end
end
