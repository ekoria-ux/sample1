class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def password_match?
    self.errors.add :password, "を入力してください" if password.blank?
    self.errors.add :password_confirmation, "を入力してください" if password_confirmation.blank?
    self.errors.add :password_confirmation, "がパスワードと一致しませんでした" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  protected
  def password_required?
    super if confirmed?
  end
end
