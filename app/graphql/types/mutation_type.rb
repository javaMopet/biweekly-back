# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :registro_tarjeta_update, mutation: Mutations::RegistroTarjetaUpdate
    field :registro_tarjeta_create, mutation: Mutations::RegistroTarjetaCreate
    field :registro_delete, mutation: Mutations::RegistroDelete
    field :inversion_create, mutation: Mutations::InversionCreate
    field :transferencia_create, mutation: Mutations::TransferenciaCreate
    field :egreso_create, mutation: Mutations::EgresoCreate
    field :ingreso_create, mutation: Mutations::IngresoCreate
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
