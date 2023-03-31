# frozen_string_literal: true

# Modelos para usuarios
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist
  # :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
end
