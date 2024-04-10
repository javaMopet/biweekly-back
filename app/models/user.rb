# frozen_string_literal: true

# Modelos para usuarios
class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :timeoutable
  #       :confirmable, :omniauthable, :trackable
  include GraphqlDevise::Authenticatable
  include GraphqlDevise::Model

  #   # Include default devise modules. Others available are:
  #   # :confirmable, :lockable,  :trackable and :omniauthable
  #   devise :jwt_authenticatable,
  #          jwt_revocation_strategy: JwtDenylist
  #   # :recoverable, :rememberable

  belongs_to :instance
end
