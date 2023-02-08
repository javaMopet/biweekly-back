class CuentaContable < ApplicationRecord
  has_many :hijos, class_name: "CuentaContable", foreign_key: "padre_id"
  belongs_to :padre, class_name: "CuentaContable", optional: true
end
