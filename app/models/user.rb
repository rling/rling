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
    u=where(:login =>login).first()
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
   def self.create_setting(params, role)
     @user = User.new(params)
     @user.login = @user.email if params[:is_login_type_email]
     @user.role = role
     @user.is_activated = true
     if @user.save
      # Save all
      # Login / Email Authentication Setting
       setting = Setting.where(:name=>"is_login_type_email").first
       setting.setting_value = (params[:is_login_type_email].nil? ? "false" : "true")
       setting.save
      # User registration Setting
       setting = Setting.where(:name=>"allow_user_register_user").first
       setting.setting_value = (params[:allow_user_register_user].nil? ? "false" : "true")
       setting.save
      # Welcome email setting
       setting = Setting.where(:name=>"send_welcome_email").first
       setting.setting_value = (params[:send_welcome_email].nil? ? "false" : "true")
       setting.save
      # Administrator registration setting
       setting = Setting.where(:name=>"allow_admin_register_user").first
       setting.setting_value = (params[:allow_admin_register_user].nil? ? "false" : "true")
       setting.save
      # User activation setting
       setting = Setting.where(:name=>"user_activation_required_on_user").first
       setting.setting_value = (params[:user_activation_required_on_user].nil? ? "false" : "true")
       setting.save
      # Administrator activation setting
       setting = Setting.where(:name=>"user_activation_required_on_admin").first
       setting.setting_value = (params[:user_activation_required_on_admin].nil? ? "false" : "true")
       setting.save
      # URL Setting
       setting = Setting.where(:name=>"site_url").first
       setting.setting_value = params[:site_url]
       setting.save
      # Smtp Setting
       setting = Setting.where(:name=>"smtp_settings").first
       setting.setting_value = params[:smtp_settings]
       setting.save
      #View users account information setting
       setting = Setting.where(:name=>"allow_view_user_account").first
       setting.setting_value = (params[:allow_view_user_account].nil? ? "false" : "true")
       setting.save
     end
 end

 def self.update_detail(user_id, form_field)
   unless form_field.nil?
      UserDetailSetting.all.each do |user_detail_setting|
        if user_detail_setting.mandatory && form_field[user_detail_setting.field_name].blank?
          mandatory_failed = true
          break
        end
        user_detail=UserDetail.where(:user_id=>user_id ,:user_detail_setting_id=>user_detail_setting.id).first
        user_detail=UserDetail.new if user_detail.nil?
        user_detail.user_id=user_id if user_detail.user_id.nil?
        user_detail.user_detail_setting_id=user_detail_setting.id if user_detail.user_detail_setting_id.nil?
        case user_detail_setting.field_type
        when "File"
          unless form_field[user_detail_setting.field_name].nil?
            asset = Asset.create(:sizes=>user_detail_setting.default_value,:upload=>form_field[user_detail_setting.field_name])
            Asset.find(user_detail.selected_value).destroy if !user_detail.selected_value.blank? && (user_detail.selected_value.to_i != 0)
            user_detail.selected_value = asset.id.to_s
          end
        when "Checkbox"
          if form_field[user_detail_setting.field_name].nil?
            user_detail.selected = "0"
          else
            user_detail.selected_value=form_field[user_detail_setting.field_name]
          end
        when "Date"
          user_detail.selected_value= Date.parse(form_field[user_detail_setting.field_name].to_a.sort.collect{|c| c[1]}.join("-"))
        else
          user_detail.selected_value=form_field[user_detail_setting.field_name]
        end
        user_detail.save
      end
    end
 end

 def self.asset_delete(user_detail)
   unless user_detail.nil?
      asset = Asset.find(user_detail.selected_value)
      asset.destroy unless asset.nil?
      user_detail.selected_value = nil
      user_detail.save
    end
 end

 def self.create_user(user)
   Notifier.welcome_email(user).deliver if get_setting("send_welcome_email")
   if (get_setting("user_activation_required_on_user") && !current_user?) || (get_setting("user_activation_required_on_admin") && current_user? && current_user.admin?)
     user.create_activation_key
     user.activation_url
     Notifier.activation_email(user).deliver
     flash[:notice] = t(:user_created)
    else
     user.is_activated = true
     user.save
   end
 end

  before_create do |user|
    user.login = user.email if user.login.blank?
  end

def self.user_destroy(user)
  if user.id==1
   flash[:notice] = t(:admin_required)
  elsif user.id==current_user.id
    flash[:notice] = t(:cannot_delete_own)
  else
    user.destroy
    flash[:notice] = t(:admin_deleted)
  end
end

def self.save_login(user)
  user.last_login_ip=user.current_login_ip
  user.current_login_ip=request.remote_ip
  user.login_count+=1
  user.save
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

