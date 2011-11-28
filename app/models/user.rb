class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :username, :email, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username, :presence => true,
                    :length   => { :maximum => 50 }
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
                       
  before_save :encrypt_password

    private

      def encrypt_password
        self.encrypted_password = encrypt(password)
      end

      def encrypt(string)
        string # Only a temporary implementation!
      end
end


# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  username           :string(255)
#  email              :string(255)
#  encrypted_password :string(255)
#

