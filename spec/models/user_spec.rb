require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :login => "sandeep", 
              :email => "sandeep@heurion.com",
              :password => 'test123',
              :password_confirmation=> 'test123',
              :role_id=> 1
            }
  end

  it "should create a new user given valid attributes" do
    user=User.create!(@attr)
  end

#validating login
  it "should have login" do
    user = User.new(@attr.merge(:login => ''))
    user.should_not be_valid
  end
  
  it "should have a unique login" do
    first_user=User.create!(@attr)
    second_user=User.new(@attr.merge(:email=>"some@email.com"))
    second_user.should_not be_valid
  end

  it "validates length of login with minimum 4 characters" do
    user=User.new(@attr.merge(:login => "123"))
    user.valid?.should be_false
    long = 'a' * 255
    user=User.new(@attr.merge(:login => long))
    user.valid?.should be_false
  end

#validating associations
  it "should be in any roles assigned to it" do
    user = User.new
    user.assign_role("assigned role")
    user.should be_in_role("assigned role")
  end

  it "should NOT be in any roles not assigned to it" do
    user = User.new
    user.should_not be_in_role("unassigned role")
  end

  it "should have a role attribute" do
    user=User.new(@attr)
    user.should respond_to(:role)
  end

  it "should destroy associated user_details" do
    user=User.create!(@attr)
    user_detail=UserDetail.create!(:user_id=>user.id,:user_detail_setting_id=>1,:selected_value=>"test")
    user.destroy
    UserDetail.find_by_id(user_detail.id).should be_nil
  end
 
  it "should require a role id" do
      User.new(@attr.merge(:role_id=>'')).should_not be_valid
    end



#validates email
  it "validates presence of email" do
    user = User.new(@attr.merge(:email => ''))
    user.valid?.should be_false
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end


  it "validates length of email within 4..254" do
    short = 'a' * 3
    user = User.new(@attr.merge(:email => short))
    user.valid?.should be_false
    long = 'a' * 255
    user=User.new(@attr.merge(:email => long))
    user.valid?.should be_false
  end

  it "validates uniqueness of email" do
    @first_user=User.create! (@attr)
    @second_user=User.new(@attr.merge(:login=>"somelogin",:password=>"somepass"))
    @second_user.should_not be_valid
  end
#validates password
  it "validates presence of password" do
    user = User.new(@attr.merge(:password => ''))
    user.valid?.should be_false
  end

  it "validates length of password minimum 6 characters" do
    short = 'a' * 5
    user = User.new(@attr.merge(:password=> short, :password_confirmation => short))
    user.valid?.should be_false
  end

  it "should not be valid without password confirmation" do
    user = User.new(@attr.merge(:password_confirmation=> ''))
    user.should_not be_valid
  end

  it "should not be valid with confirmation not matching password" do
    user = User.new(@attr.merge(:password_confirmation=> 'test111'))
    user.should_not be_valid
  end

#validates default values
  it "should take default value false for 'is_activated'" do
    user=User.new(@attr)
    user.is_activated.should== false
  end

  it "should take default value 0 for 'login_count'" do
    user=User.new(@attr)
    user.login_count.should== 0
  end

  it "should take default value 0 for 'failed_login_count'" do
    user=User.new(@attr)
    user.failed_login_count.should== 0
  end

#validating authentication
  it "should return nil on login/password mismatch" do
     user=User.create!(@attr.merge(:is_activated=>true))
     wrong_password_user = User.authenticate(@attr[:login],'wrongpass')
     wrong_password_user.should be_nil
  end

  it "should return the user on login/password match" do
     user=User.create!(@attr.merge(:is_activated=>true))
     matching_user = User.authenticate(@attr[:login], @attr[:password])
     matching_user.should_not be_nil
     matching_user.should == user
  end
 
  it "should return nil on correct login/password but not activated" do
    user=User.create!(@attr)
    matching_user=User.authenticate(@attr[:login],@attr[:password])
    matching_user.should be_nil
  end

  it "should return nil on email/password mismatch" do
    user=User.create!(@attr.merge(:is_activated=>true))
    wrong_password_user = User.authenticate(@attr[:email],'wrongpass')
    wrong_password_user.should be_nil
  end

  it "should return the user on email/password match" do
    user=User.create!(@attr.merge(:is_activated=>true,:login=>"sandeep@heurion.com"))
    matching_user = User.authenticate(@attr[:email], @attr[:password])
    matching_user.should_not be_nil
    matching_user.should == user
  end

  it "should return nil on correct email/password but not activated" do
    user=User.create!(@attr)
    matching_user=User.authenticate(@attr[:email],@attr[:password])
    matching_user.should be_nil
  end

#validating callbacks
  it "should set the hashed password" do
      user=User.create(@attr)
      user.hashed_password.should_not be_blank
    end

#validating password storing
  it "should be true if the passwords match" do
      user=User.create!(@attr)
      user.has_password?(@attr[:password]).should be_true
  end    

  it "should be false if the passwords don't match" do
      user=User.create!(@attr)
      user.has_password?("invalid").should be_false
  end 

end
