class User < ActiveRecord::Base
#Associations
  belongs_to :role
  has_many :user_details, :dependent=> :destroy

#Attributes
  attr_protected :id, :salt
  attr_accessor :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

#Validations
  validates :login, :presence => true,:uniqueness=> true, :length => {:minimum => 4, :maximum => 254}
  validates :email, :presence => true, :uniqueness=> true,:length => {:minimum => 4, :maximum => 254},
            :format=> {:with => email_regex }
  validates :password, :presence => true, :length => {:minimum => 6},:confirmation=>true
  validates :role_id, :presence=> true
#Callbacks                       
  before_save :update_salt_and_hash
  before_create :update_salt_and_hash,:activate_user

#Named Scope
  named_scope :admins,  :conditions =>"role_id = 3"

#Class Methods
  def self.authenticate(login, pass)
    u=find(:first, :conditions=>["login = ?", login])
    return nil if u.nil?
    return (User.encrypt(pass, u.salt)==u.hashed_password && u.is_activated) ? u : nil
  end

#Instance Methods
  def in_role?(role)
    role == @role
  end

  def assign_role(role)
    @role = role
  end

  def admin?
    return self.role_id==3
  end
  
  def has_password?(submitted_password)
    # Compare encrypted_password with the encrypted version of submitted_password.
    hashed_password == encrypt(submitted_password)
  end
 
   def create_reset_code
    @reset = true
    self.reset_password_key =Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )  
    save(false)
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
   self.activation_key = User.random_string(8)
  end 
  
 


end
