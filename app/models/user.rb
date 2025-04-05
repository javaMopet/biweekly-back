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

  has_many :users_instances, dependent: :destroy
  has_many :instances, through: :users_instances

  # Obtiene todos menus sin importar su rol
  has_many :menus, through: :roles, source: :resource, source_type: :Menu

  # Obtiene todos los menus dependiendo un rol en este caso manager
  # has_many :menus, -> { where(roles: { name: :manager }) }, through: :roles, source: :resource, source_type: :Menu
end
