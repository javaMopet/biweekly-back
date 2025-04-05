class Instance < ApplicationRecord
  has_many :cuentas
  has_many :users_instances, dependent: :destroy
  has_many :users, through: :users_instances

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
