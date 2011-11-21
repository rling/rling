class ModelData < ActiveRecord::Base
#Includes
 stampable

  #Associations
  belongs_to :model_component
  belongs_to :model_submission

 def self.delete(data)
   unless data.blank?
     asset = Asset.find(data.data_value)
     asset.destroy unless asset.nil?
     data.data_value = nil
     data.save
    end
 end

 def self.search(type, query)
   results = []
   msg = ""
   unless query.blank?
     query = checkforjs(query)
    case type.downcase
      when "all"
        results = results + Page.find(:all, :conditions => ['title LIKE ? or body LIKE ? and status=?',"%#{query}%", "%#{query}%","Published"])
        # Search for all models for information in title and body
        ObjectModel.all.each do |model|
          title = model.model_components.where(:component_name=>"title").first
          body = model.model_components.where(:component_name=>"body").first
          model_data = ModelData.find(:all,:conditions=>["data_value LIKE ? and model_component_id=?", "%#{query}%",title.id])
          model_data = model_data + ModelData.find(:all,:conditions=>["data_value LIKE ? and model_component_id=?", "%#{query}%",body.id])
          model_data.each do |md|
            ms = md.model_submission
            results << ms if ms.status == "Published" && !results.include?(ms)
          end
        end
      when "page"
        # Search only page
        results = results + Page.find(:all, :conditions => ['title LIKE ? or body LIKE ? and status=?',"%#{query}%", "%#{query}%","Published"])
      when ""
        # No Search
      else
        # GET THE TYPE NAME i.e. BLOGS object model
        # GET all the model submissions for that object model
        # Search for those model submissions
        model = ObjectModel.find_by_name(type)
        unless model.nil?
          title = model.model_components.where(:component_name=>"title").first
          body = model.model_components.where(:component_name =>"body").first
          model_data = ModelData.find(:all,:conditions=>["data_value LIKE ? and model_component_id=?", "%#{query}%",title.id])
          model_data = model_data + ModelData.find(:all,:conditions=>["data_value LIKE ? and model_component_id=?", "%#{query}%",body.id])
          model_data.each do |md|
            ms = md.model_submission
            results << ms if ms.status == "Published" && !results.include?(ms)
          end
        end
      end
      msg = "#{t(:search_string)} #{results.size} #{t(:search_result)}"
    else
      msg = t(:search_found_empty)
    end
 end
end


# == Schema Information
#
# Table name: model_data
#
#  id                  :integer(4)      not null, primary key
#  model_component_id  :integer(4)
#  model_submission_id :integer(4)
#  data_value          :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  creator_id          :integer(4)
#  updater_id          :integer(4)
#

