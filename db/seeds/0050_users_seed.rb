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
      DECLARE @reseedc tinyint = IIF(@@ROWCOUNT > 0, 0, 0);
      DBCC CHECKIDENT (users, RESEED, @reseedc);
      '
  )
rescue StandardError => e
  puts "No sqlserver #{e.message}"
end

user1 = User.new(
  email: "biweeklyapplication@gmail.com",
  password: 'Pqt:72i_9b',
  password_confirmation: 'Pqt:72i_9b',
  name: "Super User"
)
user1.save!
user2 = User.new(
  email: "horaciopenamendoza@gmail.com",
  password: 'Erumur2024*',
  password_confirmation: 'Erumur2024*',
  name: "Horacio Peña Mendoza"
)
user2.save!
