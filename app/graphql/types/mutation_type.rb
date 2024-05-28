# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :user_remove_role, mutation: Mutations::Admin::UserRemoveRole
    field :user_add_role, mutation: Mutations::Admin::UserAddRole
    field :instance_delete, mutation: Mutations::InstanceDelete
    field :instance_update, mutation: Mutations::InstanceUpdate
    field :instance_create, mutation: Mutations::InstanceCreate
    field :user_delete, mutation: Mutations::UserDelete
    field :user_update, mutation: Mutations::Admin::UserUpdate
    field :user_menu_update, mutation: Mutations::Admin::UserMenuUpdate
    field :traspaso_update, mutation: Mutations::TraspasoUpdate
    field :traspaso_delete, mutation: Mutations::TraspasoDelete
    field :traspaso_create, mutation: Mutations::TraspasoCreate
    field :registro_update, mutation: Mutations::RegistroUpdate
    field :registro_tarjeta_delete, mutation: Mutations::RegistroTarjetaDelete
    field :registro_tarjeta_pago_delete, mutation: Mutations::RegistroTarjetaPagoDelete
    field :registros_tarjeta_delete, mutation: Mutations::RegistrosTarjetaDelete
    field :banco_delete, mutation: Mutations::BancoDelete
    field :banco_update, mutation: Mutations::BancoUpdate
    field :banco_create, mutation: Mutations::BancoCreate
    field :registro_create, mutation: Mutations::RegistroCreate
    # se utiliza el importar_registros
    # field :registro_multiple_create, mutation: Mutations::RegistroMultipleCreate
    field :registro_tarjeta_update, mutation: Mutations::RegistroTarjetaUpdate
    field :registro_tarjeta_date_update, mutation: Mutations::RegistroTarjetaDateUpdate
    field :registro_tarjeta_create, mutation: Mutations::RegistroTarjetaCreate
    field :registro_tarjeta_multiple_create, mutation: Mutations::RegistroTarjetaMultipleCreate
    field :registro_delete, mutation: Mutations::RegistroDelete
    field :registros_delete, mutation: Mutations::RegistrosDelete
    field :estado_movimiento_delete, mutation: Mutations::EstadoMovimientoDelete
    field :estado_movimiento_update, mutation: Mutations::EstadoMovimientoUpdate
    field :estado_movimiento_create, mutation: Mutations::EstadoMovimientoCreate
    field :cuenta_contable_update, mutation: Mutations::CuentaContableUpdate
    field :cuenta_contable_delete, mutation: Mutations::CuentaContableDelete
    field :cuenta_contable_create, mutation: Mutations::CuentaContableCreate
    field :cuenta_delete, mutation: Mutations::CuentaDelete
    field :cuenta_update, mutation: Mutations::CuentaUpdate
    field :cuenta_create, mutation: Mutations::CuentaCreate
    field :cuenta_saldo_update, mutation: Mutations::CuentaSaldoUpdate
    field :categoria_update, mutation: Mutations::Categorias::CategoriaUpdate
    field :categoria_delete, mutation: Mutations::Categorias::CategoriaDelete
    field :categoria_create, mutation: Mutations::Categorias::CategoriaCreate
    # field :user_update, mutation: Mutations::UserUpdate
    # field :user_create, mutation: Mutations::UserCreate
    field :importar_registros, mutation: Mutations::ImportarRegistros
  end
end
