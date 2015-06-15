# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  email      :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  # user_id points to the OWNER of a contact
  validates :email, :user_id, presence: true

  belongs_to :user
  has_many :contact_shares
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :shared_users, through: :contact_shares, source: :user
end
