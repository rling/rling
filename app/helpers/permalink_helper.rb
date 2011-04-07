module PermalinkHelper
def create_permalink(string, separator = '-', max_size = 127)
  
  # words to ignore, usually the same words ignored by search engines
  ignore_words = ['a', 'an', 'the']
  ignore_re    = String.new
  
  # building ignore regexp
  ignore_words.each{ |word|
    ignore_re << word + '\b|\b'
  }
  ignore_re = '\b' + ignore_re + '\b'
  
  # replace apostrophes with separator
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

def create_permalink_parent(string, separator = '-', max_size = 127)

  # words to ignore, usually the same words ignored by search engines
  ignore_words = ['a', 'an', 'the']
  ignore_re    = String.new

  # building ignore regexp
  ignore_words.each{ |word|
    ignore_re << word + '\b|\b'
  }
  ignore_re = '\b' + ignore_re + '\b'
    

  # replace apostrophes with separator
 string=string.pluralize
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

end
