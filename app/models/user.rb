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
  attr_accessible :username, :email

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username,  :presence => true,
                    :length   => { :maximum => 50 }
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
end
