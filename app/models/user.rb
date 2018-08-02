class User < ApplicationRecord
  belongs_to :location
  has_many :permissions
  has_many :messages 
end
