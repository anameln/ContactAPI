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

require 'test_helper'

class ContactShareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
