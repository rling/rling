require 'spec_helper'

describe Page do
  before (:each) do
    @page=Page.create :perma_link => '/home',:title => 'home'
    @menuset=Menuset.create :name=>"header"
    @menu=Menu.create :page_id => @page.id ,:menuset_id=>@menuset.id,:name=>'contact' 
    @pagevariable=PageVariable.create :page_id=>@page.id
    @page2=Page.create  :title=>'home' ,:perma_link=>'/home1'

 end

 it "should  not be valid without a title"        do
  
   @page.should be_valid 

   @page.title=nil
   @page.should_not be_valid
   @page.errors[:title].should include("can't be blank")

    
   @page.title=' '
   @page.should_not be_valid
   @page.errors[:title].should include("can't be blank")

   @page.home_page.should eql(false)
   @page.page_view_type.should eql(0)
  end
   
  it "should not be  valid without a perma link" do
   @page.should be_valid  

   @page.perma_link=nil
   @page.should_not be_valid
   @page.errors[:perma_link].should include("can't be blank")
 
   @page.perma_link=' '
   @page.should_not be_valid
   @page.errors[:perma_link].should include("can't be blank")
  end
 

  it "should create unique perma link" do
   page = Page.new(:perma_link =>'/home' ,:title=>"home")
   page.should_not  be_valid
   page.errors[:perma_link].should include("has already been taken")
  end

  it "should have a menu" do
    @page.menu.should eql(@menu)
  end
  it "should have many page variables" do
     
     @page.page_variables << PageVariable.new(:page_id => @page.id)
     @page.page_variables << PageVariable.new(:page_id => @page.id)
     @page.should have(3).page_variables
  end
 
  
  it "should destroy associated menu" do

       @page.destroy
      Menu.find_by_id(@menu.id).should be_nil
  end

  it "should destroy associated page variable" do

       @page.destroy
       PageVariable.find_by_id(@pagevariable.id).should be_nil
  end

  it "testing the association of menu" do
   Page.reflect_on_association(:menu).should_not  be_nil
  end
	
    it  "tests perma_link generations " do
      Page.new.generate_perma_link("home").should_not be_nil
      Page.new.generate_perma_link("home").should eql("home-1")
      Page.new.generate_perma_link("home2").should_not be_nil
      Page.new.generate_perma_link("home2").should eql("home2")
  end

     it "tests method menu_menuset_id " do
       @page.menu_menuset_id.should eql(@menuset.id)
    end

    it "tests  method menu_menuset_id=(value)" do
     menuset_id=@page2.menu_menuset_id=(@menuset.id)
     menu=Menu.create :page_id =>@page2.id ,:parent_id=>@menu.id ,:menuset_id=>menuset_id ,:name=>'contact'
     menu.menuset_id.should eql(@menuset.id) 
    end
 
   it "tests menu_parent_id" do
      @page.menu_parent_id .should eql(0)
      menu=Menu.create :page_id =>@page2.id ,:parent_id=>@menu.id ,:menuset_id=>@menuset.id ,:name=>'contact'
      @page2.menu_parent_id.should eql(@menu.id) 
   end
          
  it "tests menu_parent_id=(value) " do
      parent_id= @page2.menu_parent_id=(@menu.id)
      menu=Menu.create :page_id =>@page2.id, :parent_id=>parent_id ,:name=>'contact' ,:menuset_id=>@menuset.id
      
      menu.parent_id.should eql(@menu.id)
  end   

  it "tests menu_name" do
      @page.menu_name.should eql(@menu.name)
  end


  it "tests menu_name=(value) " do
    
     menu_name=@page2.menu_name=('about')
     menu=Menu.create :page_id =>@page2.id,:name=>menu_name ,:menuset_id=>@menuset.id
     menu.name.should eql('about')
  end

 it "tests permalnk method" do
  @page.permalnk.should eql('/home')
 end

 it "tests permalnk=(value) method " do
    perma_link=@page2.permalnk=('/about1')
    perma_link.should_not be_nil
    perma_link.should eql('/about1')
    page2=Page.create :title=>'home' , :perma_link=>perma_link + '2'
    page2.perma_link .should eql('/about12')
 end

end
