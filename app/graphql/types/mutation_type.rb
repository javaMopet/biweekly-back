# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :traspaso_update, mutation: Mutations::TraspasoUpdate
    field :traspaso_delete, mutation: Mutations::TraspasoDelete
    field :traspaso_create, mutation: Mutations::TraspasoCreate
    field :registro_update, mutation: Mutations::RegistroUpdate
    field :registro_tarjeta_delete, mutation: Mutations::RegistroTarjetaDelete
    field :banco_delete, mutation: Mutations::BancoDelete
    field :banco_update, mutation: Mutations::BancoUpdate
    field :banco_create, mutation: Mutations::BancoCreate
    field :registro_create, mutation: Mutations::RegistroCreate
    field :registro_tarjeta_update, mutation: Mutations::RegistroTarjetaUpdate
    field :registro_tarjeta_create, mutation: Mutations::RegistroTarjetaCreate
    field :registro_delete, mutation: Mutations::RegistroDelete
    field :detalle_movimiento_delete, mutation: Mutations::DetalleMovimientoDelete
    field :detalle_movimiento_update, mutation: Mutations::DetalleMovimientoUpdate
    field :detalle_movimiento_create, mutation: Mutations::DetalleMovimientoCreate
    field :movimiento_delete, mutation: Mutations::MovimientoDelete
    field :movimiento_update, mutation: Mutations::MovimientoUpdate
    field :movimiento_create, mutation: Mutations::MovimientoCreate
    field :estado_movimiento_delete, mutation: Mutations::EstadoMovimientoDelete
    field :estado_movimiento_update, mutation: Mutations::EstadoMovimientoUpdate
    field :estado_movimiento_create, mutation: Mutations::EstadoMovimientoCreate
    field :cuenta_contable_update, mutation: Mutations::CuentaContableUpdate
    field :cuenta_contable_delete, mutation: Mutations::CuentaContableDelete
    field :cuenta_contable_create, mutation: Mutations::CuentaContableCreate
    field :cuenta_delete, mutation: Mutations::CuentaDelete
    field :cuenta_update, mutation: Mutations::CuentaUpdate
    field :cuenta_create, mutation: Mutations::CuentaCreate
    field :categoria_update, mutation: Mutations::Categorias::CategoriaUpdate
    field :categoria_delete, mutation: Mutations::Categorias::CategoriaDelete
    field :categoria_create, mutation: Mutations::Categorias::CategoriaCreate
    field :user_update, mutation: Mutations::UserUpdate
    field :user_create, mutation: Mutations::UserCreate
  end
end
