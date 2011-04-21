class User < ActiveRecord::Base
#Includes
  include ApplicationHelper
  model_stamper
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
  validates :password, :presence => true, :length => {:minimum => 6},:confirmation=>true, :if => :password_validation_required?
  validates :role_id, :presence=> true
#Callbacks                       
  before_save :update_salt_and_hash
  before_create :update_salt_and_hash,:activation_key

#Named Scope
  scope :admins,  :conditions =>"role_id = 3"

#Class Methods
  def self.authenticate(login, pass)
    u=find(:first, :conditions=>["login = ?", login])
    return nil if u.nil?
    return (User.encrypt(pass, u.salt)==u.hashed_password && u.is_activated) ? u : nil
  end

 
 def self.tags(handle)
    tagarray = ["login","email","password","activation_url","reset_password_url"]
    UserDetailSetting.all.each do |uds|
       tagarray << uds.field_name
    end 
    return tagarray
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

  def recently_reset?
    @reset
  end
 
  def create_reset_code
    @reset = true
    self.reset_password_key =Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )  
    save(false)
  end

  def create_activation_key
    @activated= true
    self.activation_key  = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    save(false)
  end

  def activation_url
    return "#{get_setting("site_url")}/users/#{self.activation_key}/activate"
  end

  def reset_password_url
    return "#{get_setting("site_url")}/password_resets/#{self.reset_password_key}/reset"
  end
  def delete_reset_code
    self.attributes = {:reset_password_key => nil}
    save(false)
  end
  def delete_activation_key
    self.attributes = {:activation_key => nil}
    save(false)
  end
  
   def active?
     activation_key.nil?
   end


   def recently_activated?
     @activated
   end

   def recently_created?
     @create
   end

   def create_welcome_msg
     @create = true
   end

   def get_variable_info(variablename)
     if self.respond_to?(variablename.downcase)
      self.send(variablename.downcase)
     end
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
 
  def password_validation_required?
    hashed_password.blank? || !password.blank?
  end

end

# == Schema Information
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  login              :string(255)     not null
#  email              :string(255)     not null
#  role_id            :integer(4)
#  hashed_password    :string(255)
#  salt               :string(255)
#  activation_key     :string(255)
#  is_activated       :boolean(1)      default(FALSE)
#  reset_password_key :string(255)
#  login_count        :integer(4)      default(0)
#  failed_login_count :integer(4)      default(0)
#  last_request_at    :datetime
#  current_login_at   :datetime
#  last_login_at      :datetime
#  current_login_ip   :string(255)
#  last_login_ip      :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

