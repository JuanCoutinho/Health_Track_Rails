class Phone < ApplicationRecord
    belongs_to :user
  
    validates :number, presence: true
    validates :phone_type, presence: true
  end
  