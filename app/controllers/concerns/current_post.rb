module CurrentPost
  extend ActiveSupport::Concern

  def save_post
    return Post.find(params[:id])
  end
end
