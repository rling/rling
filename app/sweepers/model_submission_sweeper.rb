class ModelSubmissionSweeper < ActionController::Caching::Sweeper
  observe ModelSubmission
  def after_save(model_submission)
    expire_cache(model_submission)
  end
  
  def after_destroy(model_submission)
    expire_cache(model_submission)
  end

private
  def expire_cache(model_submission)
    expire_fragment(model_submission.perma_link) 
  end

  
end
