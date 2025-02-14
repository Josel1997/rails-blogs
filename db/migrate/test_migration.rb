class RemoveDescriptionFromBlogPosts < ActiveRecord::Migration[8.0]
    def change
      remove_column :blog_posts, :description, :string
    end
  end
  