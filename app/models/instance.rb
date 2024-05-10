class Instance < ApplicationRecord
  has_many :users
  has_many :cuentas

  validates :name, presence: true, uniqueness: { case_sensitive: false  }
end
