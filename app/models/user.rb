# == Schema Information
#
# Table name: users
#
#  id            :integer         not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  username      :string(255)
#  email         :string(255)
#  password_hash :string(255)
#  pssword_salt  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email
end
