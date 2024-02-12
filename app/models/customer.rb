class Customer < ApplicationRecord
    has_many :contacts, dependent: :destroy
  end
  