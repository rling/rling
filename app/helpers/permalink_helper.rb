module PermalinkHelper
def create_permalink(string, type='normal', separator = '-', max_size = 127)
  
  # words to ignore, usually the same words ignored by search engines
  ignore_words = ['a', 'an', 'the']
  ignore_re    = String.new
  
  # building ignore regexp
  ignore_words.each{ |word|
    ignore_re << word + '\b|\b'
  }
  ignore_re = '\b' + ignore_re + '\b'
  

  # replace apostrophes with separator

  if type == 'plural'
    string=string.pluralize
  end
  permalink = string.gsub("'", separator)
   permalink = string.gsub(" ", separator)
  # delete ignore words
  permalink.gsub!(ignore_re, '')
 
  # all down
  permalink.downcase!
  
  # preserve alphanumerics, everything else becomes a separator
  permalink.gsub!(/[^a-z0-9]+/, separator)
  
  # enforce the maximum component length and return it
  permalink = permalink.to(max_size)
  
  # trim any leading or trailing separators
  return permalink.gsub(/^\\#{separator}+|\\#{separator}+$/, '')
  
end

def generate_perma_link(permaobj,perma_link)
  puts permaobj.inspect
  #entity = permaobj.find_by_perma_link("/"+perma_link) if permaobj != ObjectModel
  #entity = permaobj.find_by_perma_link_parent("/"+perma_link) if permaobj == ObjectModel
  entity = permaobj.find_by_perma_link(perma_link) if permaobj != ObjectModel
  entity = permaobj.find_by_perma_link_parent(perma_link) if permaobj == ObjectModel
  
  if entity.nil?
    return perma_link
  else
    count = 0
    if permaobj== ObjectModel
      #until (permaobj.find_by_perma_link_parent("/"+perma_link + "-" + count.to_s).nil?)
      until (permaobj.find_by_perma_link_parent(perma_link + "-" + count.to_s).nil?)
        count+=1
      end
    else 
      #until (permaobj.find_by_perma_link("/"+perma_link + "-" + count.to_s).nil?)
      until (permaobj.find_by_perma_link(perma_link + "-" + count.to_s).nil?)
        count+=1
      end
    end
    return perma_link + "-" + count.to_s
  end
end

end
