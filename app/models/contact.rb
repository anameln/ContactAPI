class Contact < ActiveRecord::Base
  validates :email, :user_id, presence: true, uniqueness: true
  belongs_to :user
end
