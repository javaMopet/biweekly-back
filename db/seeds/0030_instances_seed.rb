# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM users RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql database #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute(
    'DELETE FROM traspaso_detalles;
    DELETE FROM registros_tarjeta;
    DELETE FROM traspasos;
    DELETE FROM registros;
    DELETE FROM categorias;
    delete from cuentas;
    delete from cuentas_contable;
    delete from bancos;
    DELETE FROM users;
    DELETE FROM instances;
    DECLARE @reseedc tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (instances, RESEED, @reseedc);
      '
  )
rescue StandardError => e
  puts "No sqlserver #{e.message}"
end

instance1 = Instance.new(name: "Ingresos y Egresos H&L", logo_image: "logo_handl.png", dominio: "lyh")
instance1.save!

instance2 = Instance.new(name: "Prueba2", logo_image: "logo_hand2.png", dominio: "test")
instance2.save!
