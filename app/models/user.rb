class User < ApplicationRecord
  def pam
    return nil if pas.nil? || pad.nil?
    (pas + 2 * pad) / 3.0 
  end

  def imc
    return nil if height.nil? || weight.nil?  
    (weight / (height ** 2)).round(2)
  end

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
