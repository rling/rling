class User < ActiveRecord::Base
#Associations
  belongs_to :role
  has_many :user_details, :dependent=> :destroy

#Attributes
  attr_protected :id, :salt
  attr_accessor :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

#Validations
  validates :login, :presence => true,:uniqueness=> true, :length => {:minimum => 4, :maximum =>15 }
  validates :email, :presence => true, :uniqueness=> true,:length => {:minimum => 6, :maximum => 254},
            :format=> {:with => email_regex }
  validates :password, :presence => true, :length => {:minimum => 6},:confirmation=>true
  validates :role_id, :presence=> true
#Callbacks                       
  after_save :activate_user
  before_save :update_salt_and_hash
  before_create :update_salt_and_hash
#Class Methods
  def self.authenticate(login, pass, is_login)
    if is_login
	    u=find(:first, :conditions=>["login = ?", login])
    else
	    u=find(:first, :conditions=>["email = ?", login])
    end 	
    return nil if u.nil?
    return u if User.encrypt(pass, u.salt)==u.hashed_password && u.is_activated
    nil
  end

#Instance Methods
  def in_role?(role)
    role == @role
  end

  def assign_role(role)
    @role = role
  end

  def has_password?(submitted_password)
    # Compare encrypted_password with the encrypted version of submitted_password.
    hashed_password == encrypt(submitted_password)
  end


#Private Methods
 private
 
  def update_salt_and_hash
    unless password.blank?
      self.salt = User.random_string(10) unless self.salt?
      self.hashed_password = User.encrypt(password, self.salt)
    end
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass+salt)
  end

  def encrypt(str)
     Digest::SHA1.hexdigest(str+salt)
  end


  def self.random_string(len)
    #generat a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end
 
  def activate_user
   @activate_setting = Setting.find_by_name(:user_activation_email)
   if !@activate_setting.nil? && @activate_setting.setting_data
     #Notifier.send_activation_email
   end
  end 
  
end
