class UsersInstance < ApplicationRecord
  belongs_to :user
  belongs_to :instance

  validates :user_id, uniqueness: { scope: :instance_id, message: "ya está asociado a esta instancia" }
end
