class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :resumes

  def admin?
    self.is_admin
  end
end
