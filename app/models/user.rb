class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :time_records, dependent: :destroy
  def self.ransackable_attributes(auth_object = nil)
    %w[username]
  end
end
