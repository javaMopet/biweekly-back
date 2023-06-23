class CuentaBlueprint < Blueprinter::Base
  identifier :id

  fields :nombre, :identificador

  view :normal do
    fields :id, :nombre, :identificador
    association :banco, blueprint: BancoBlueprint
  end
end
