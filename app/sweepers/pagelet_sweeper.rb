class PageletSweeper < ActionController::Caching::Sweeper
  observe Pagelet
  def after_save(pagelet)
    expire_cache(pagelet)
  end
  
  def after_destroy(pagelet)
    expire_cache(pagelet)
  end

private
  def expire_cache(pagelet)
    expire_fragment(pagelet.handle) 
  end

  
end
