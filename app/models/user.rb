class User < ApplicationRecord
  has_secure_password
  has_many :phones, dependent: :destroy
  
  def pam
    return nil if pas.nil? || pad.nil?
    (pas + 2 * pad) / 3.0 
  end

  def imc
    return nil if height.nil? || weight.nil?  
    (weight / (height ** 2)).round(2)
  end

  def calculate_tmb
    return nil if weight.nil? || height.nil? || age.nil? || gender.nil?

    calculated_tmb = if gender.downcase == 'male'
      (10 * weight + 6.25 * height * 100 - 5 * age + 5).round(2)
    elsif gender.downcase == 'female'
      (10 * weight + 6.25 * height * 100 - 5 * age - 161).round(2)
    else
      nil
    end

    update(tmb: calculated_tmb) if calculated_tmb
    calculated_tmb
  end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
