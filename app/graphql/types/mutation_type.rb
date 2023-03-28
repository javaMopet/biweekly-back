module Types
  class MutationType < Types::BaseObject
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
