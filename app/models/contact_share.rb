# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ContactShare < ActiveRecord::Base
  # user_id points to the user with whom the contact has been shared

  belongs_to :user
  belongs_to :contact
  
end
