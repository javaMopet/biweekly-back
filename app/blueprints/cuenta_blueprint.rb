class CuentaBlueprint < Blueprinter::Base
  identifier :id

  fields :nombre, :identificador

  view :normal do
    fields :id, :nombre, :identificador, :dia_corte, :tipo_cuenta_id, :saldo
    association :banco, blueprint: BancoBlueprint
  end
end
