module CacheHelper
def clear_cache
  root_path = Rails.root.to_s + "/tmp/cache"
  entries = Dir.entries(root_path)
  entries.each do |entry|
   unless (entry == "." || entry == "..")
       FileUtils.rm_rf(root_path + "/"+ entry)
   end
end
end
end
