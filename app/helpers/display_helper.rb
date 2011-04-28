module DisplayHelper

def check_component_type(form_component,form_submission,data_obj)
  unless form_submission.nil?
   if data_obj == FormDatum
    form_data=data_obj.find_by_form_submission_id_and_form_component_id(form_submission.id,form_component.id)
   else
    form_data=data_obj.find_by_comment_submission_id_and_comment_component_id(form_component.id,form_submission.id)
   end 
   value = (form_submission.id.nil? ? form_component.default_value : ( form_data.data_value unless form_data.nil? ) )
   
  else
   value=form_component.default_value
  end
  return return_field_tag(form_component.component_name,value,form_component.component_type,form_component.component_values,form_submission)
end

def get_view_model_submission(object_model,view,ms,sort="",order="")
  output = []
  unless object_model.nil?
    ids = ms.collect{|sub|sub.id}
    conditions = ""
    view.view_conditions.each do |cond|
      value = cond.value
      value = "%#{cond.value}%" if cond.operator== "LIKE"
      if ["created_at","updated_at","creator_id","updater_id"].include?(cond.name)
          conditions << " #{cond.relation_with} (#{cond.name} #{cond.operator} '#{value}') "
      else
        mc = object_model.model_components.first(:conditions=>["component_name=?",cond.name])
        unless mc.nil?
          conditions << " #{cond.relation_with} (model_component_id=#{mc.id.to_s} and data_value #{cond.operator} '#{value}') "
        end
      end
    end
    conditions = "and (#{conditions})" unless conditions.blank?
    md = ModelData.find(:all,:conditions=>["model_submission_id  IN (?)  #{conditions}",ids])
    md.each{|data|output << data.model_submission unless output.include?(data.model_submission)}
    output = get_view_model_submission_order(object_model,view,output,sort,order)
  end
  return output
end


def get_view_model_submission_order(object_model,view,submissions,sort,order)
  output = []
  sort = view.default_sort_order if sort.blank?
  order = view.default_sort_order_value if order.blank?
  order = "ASC" if order.blank?
  order_txt = ""
  conditions = ""
  if ["created_at","updated_at","creator_id","updater_id"].include?(sort)
    order_txt << " #{sort} #{order} "
  else
    mc = object_model.model_components.first(:conditions=>["component_name=?",sort])
    unless mc.nil?
      conditions << "and model_component_id=#{mc.id.to_s}"
      order_txt << " data_value #{order}"
    end
  end
  ids = submissions.collect{|sub|sub.id}
  if view.limit.blank?
    md = ModelData.find(:all,:conditions=>["model_submission_id  IN (?) #{conditions}",ids],:order=>order_txt)
 
 else
    md = ModelData.find(:all,:conditions=>["model_submission_id  IN (?) #{conditions}",ids],:order=>order_txt, :limit=>view.limit)
  end
 
  md.each{|data|output << data.model_submission unless output.include?(data.model_submission)}
  return output
end

def get_category_set_tree(categoryset,page)
 view = Page.find(page.associated_view)
 cats = categoryset.categories.find(:all, :conditions=>"parent_id=0")
 output = "<ul>"
 cats.each do |cat|
   output << "<li>"
   output << link_to(cat.name,"/#{view.perma_link}?category=#{cat.id}")
   output << get_child_categories(cat,view)
   output << "</li>"
  end
  output << "</ul>"
 return output
end


def get_child_categories(cat,view)
  output = ""
  unless cat.children.empty?
    output = "<ul>"
    cat.children.each do |child|
      output << "<li>"
      output << link_to(child.name,"/#{view.perma_link}?category=#{child.id}")
      output << "</li>"
      output << get_child_categories(child,view)
    end
    output << "</ul>"
  end
  return output
end

end
