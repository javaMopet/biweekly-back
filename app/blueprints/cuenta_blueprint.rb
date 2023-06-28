class CuentaBlueprint < Blueprinter::Base
  identifier :id

  fields :nombre, :identificador

  view :normal do
    fields :id, :nombre, :identificador, :dia_corte
    association :banco, blueprint: BancoBlueprint
  end
end
