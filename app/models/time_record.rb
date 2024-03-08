class TimeRecord < ApplicationRecord
  belongs_to :user
  has_many :breaks, dependent: :destroy
  
  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end

  def self.ransackable_attributes(auth_object = nil)
    super + %w[user_id]
  end
  
end