# frozen_string_literal: true

# Modelo Cuenta Contable
class CuentaContable < ApplicationRecord
  has_many :hijos, class_name: 'CuentaContable', foreign_key: 'padre_id'
  belongs_to :padre, class_name: 'CuentaContable', optional: true

  def nombre_completo
    "#{id} - #{nombre}"
  end
end
