class AddAllowShowOnHomepageAndAllowDraftsToObjectModel < ActiveRecord::Migration
  def self.up
    add_column :object_models,:allow_show_on_homepage,:boolean ,:default => 0
    add_column :object_models,:allow_drafts,:boolean
  end

  def self.down
    remove_column :object_models,:allow_show_on_homepage
    remove_column :object_models,:allow_drafts
  end
end
