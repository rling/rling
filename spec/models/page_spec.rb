require 'spec_helper'

describe Page do
 before (:each) do
  @page_attributes={ :perma_link =>'/permalink' ,:title=>'title' }
  @menu_attributes={ :name=>'name',:menuset_id=>'1'}
  @menuset_attributes ={:name=>'name'}
  @page_variable_attributes={:variable_value=>'value'} 
  @page=Page.create!(@page_attributes)
  @menuset=Menuset.create!(@menuset_attributes)
  @menu=Menu.create!(@menu_attributes)  
 end
 it "should create at valid attributes" do
    
     @page.should be_valid
 end
  
 
 #*************************************Tests Validations********************************************************#

  it "should not be valid without a title" do
   page=Page.new(@page_attributes.merge(:title=>nil))
   page.should_not be_valid 
 
   page=Page.new(@page_attributes.merge(:title=>' '))
   page.should_not be_valid

  end
  
  it "should not be valid without a perma link" do
  page=Page.new(@page_attributes.merge(:perma_link=>nil))
  page.should_not be_valid
  
  page=Page.new(@page_attributes.merge(:perma_link=>''))
  page.should_not be_valid
 
  end
  it "should have a unique perma link " do
 
   @second_page=Page.new(@page_attributes.merge(:title=>'some_title'))
   @second_page.should_not be_valid
  end
 #*******************************Tests Default Values*************************************************#
   it "should test home_page default value" do
   page=Page.new(@page_attributes)
   page.home_page.should eql(false)
   end
   
   it "should test page_view_type default value" do
    page=Page.new(@page_attributes)
    page.page_view_type.should eql(0)
    end

  #**********************************Tests Associations**********************************************#
   it "should have one  menu "do
   
    
     first_menu=Menu.create!(@menu_attributes.merge(:page_id=>@page.id))
     second_menu=Menu.create!(@menu_attributes.merge(:page_id=>@page.id))
     @page.menu.should eql(first_menu)
     @page.menu.should_not eql(second_menu)
  end

  it "testing the association of menu" do
   Page.reflect_on_association(:menu).should_not  be_nil
  end
   
  it "should have many page variables" do
   
   @first_page_variable=PageVariable.create!(@page_variable_attributes.merge(:page_id=>@page.id))
   @second_page_variable=PageVariable.create!(@page_variable_attributes.merge(:page_id=>@page.id))
   @page.should have(2).page_variables
  end
 

  it "testing the association ofpage variable" do
   Page.reflect_on_association(:page_variables).should_not  be_nil
  end
   
#*****************************************Tests Dependent Destroy***************************************#
   it "should destroy associated menu" do
     page=Page.create!(@page_attributes.merge(:perma_link=>'/somepermalink'))
     menu=Menu.create!(@menu_attributes.merge(:page_id=>page.id))
     page.destroy
     Menu.find_by_id(menu.id).should be_nil
   end


   it "should destroy associated page variables"  do
       page=Page.create!(@page_attributes.merge(:perma_link=>'/somepermalink'))
      first_page_variable=PageVariable.create!(@page_variable_attributes.merge(:page_id => page.id))
      second_page_variable=PageVariable.create!(@page_variable_attributes.merge(:page_id => page.id))
      page.destroy
      PageVariable.find_by_id(first_page_variable.id).should be_nil
      PageVariable.find_by_id(first_page_variable.id).should be_nil
   end
#******************************************tests Call backs **********************************************#
        

   

   

   it "should  test after_create  callback " do

       page=Page.new(@page_attributes.merge(:perma_link=>'/somepermalink')) 
       
       page.should_receive(:set_menu)
     

       page.save
   end 
  
#**************************************Tests Instance Methods*******************************************#
 #1.
      it "tests method menu_menuset_id " do
    
       
        menu=Menu.create!(@menu_attributes.merge(:page_id=>@page.id ,:menuset_id=>@menuset.id))
        @page.menu_menuset_id.should  eql(@menuset.id)
       end 
 #2.
       it "tests menthod menu_menuset_id=(value) "do
       
        menuset_id=@page.menu_menuset_id=(123) 
        menuset_id.should eql(123)    
        menu=Menu.create!(@menu_attributes.merge(:page_id=>@page.id ,:menuset_id=>menuset_id))
        menu.menuset_id.should eql(123)    
        end

 #3.  
       it "should test menu_parent_id " do
         
         menu=Menu.create!(@menu_attributes.merge(:page_id=>@page.id ,:menuset_id=>@menuset.id ,:parent_id=>@menu.id))
         @page.menu_parent_id.should eql(@menu.id)
        
       end
 #4   
       it "should test menu_parent_id=(value) " do

        parent_id= @page.menu_parent_id=(@menu.id)
        menu=Menu.create!(@menu_attributes.merge(:page_id=>@page.id ,:menuset_id=>@menuset.id ,:parent_id=>parent_id))
        menu.parent_id.should eql(@menu.id)

       end
#5
    it "tests menu_name" do
       menu=Menu.create!(@menu_attributes.merge(:page_id=>@page.id ,:menuset_id=>@menuset.id ))
      @page.menu_name.should eql(menu.name)
   end
#6

  it "tests menu_name=(value) " do
    
     menu_name=@page.menu_name=('menu_name')
     menu=Menu.create!(@menu_attributes.merge(:page_id=>@page.id ,:menuset_id=>@menuset.id ,:name=>menu_name))
     menu.name.should eql('menu_name')
  end 



end
#****************************************END***************************************************************#


# == Schema Information
#
# Table name: pages
#
#  id                         :integer(4)      not null, primary key
#  title                      :string(255)
#  body                       :text
#  perma_link                 :string(255)
#  home_page                  :boolean(1)      default(FALSE)
#  page_view_type             :integer(4)      default(0)
#  created_at                 :datetime
#  updated_at                 :datetime
#  type                       :string(255)
#  email                      :string(255)
#  view_type                  :string(255)
#  view_for                   :integer(4)
#  creator_id                 :integer(4)
#  updater_id                 :integer(4)
#  allow_create_on_permission :boolean(1)      default(FALSE)
#

