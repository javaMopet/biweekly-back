# frozen_string_literal: true

# Modelos para usuarios
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :timeoutable
  #       :confirmable, :omniauthable, :trackable
  include GraphqlDevise::Authenticatable
  include GraphqlDevise::Model

  #   # Include default devise modules. Others available are:
  #   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #   devise :database_authenticatable,
  #          :registerable,
  #          :validatable,
  #          :jwt_authenticatable,
  #          jwt_revocation_strategy: JwtDenylist
  #   # :recoverable, :rememberable, :validatable

  #   validates :email, presence: true, uniqueness: true

  belongs_to :instance
end
