class Banco < ApplicationRecord
  validates :nombre, presence: true, uniqueness: { case_sensitive: false }
end
