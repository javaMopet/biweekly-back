class Instance < ApplicationRecord
  has_many :users
  has_many :cuentas
end
