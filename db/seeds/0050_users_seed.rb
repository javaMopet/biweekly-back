# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM users RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql database #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute(
    '
    DELETE FROM traspaso_detalles;
    DELETE FROM registros_tarjeta;
    DELETE FROM traspasos;
    DELETE FROM registros;
     DELETE FROM categorias;
    DELETE FROM users;
      DECLARE @reseedc tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
      DBCC CHECKIDENT (users, RESEED, @reseedc);
      '
  )
rescue StandardError => e
  puts "No sqlserver #{e.message}"
end

user1 = User.new(
  email: "hpenam@uaemex.mx",
  password: 'Sv)c2%h$Kzw2][GYu0b',
  password_confirmation: 'Sv)c2%h$Kzw2][GYu0b',
  name: "Horacio Peña Mendoza"
)
user1.save!
user2 = User.new(email: "me@gmail.com", password: '123456', password_confirmation: '123456', name: "prueba")
user2.save!
