class AddTipoMovimientoToCategoria < ActiveRecord::Migration[7.0]
  def change
    add_reference :categorias, :tipo_movimiento, null: false, foreign_key: true
  end
end
