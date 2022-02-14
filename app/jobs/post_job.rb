class PostJob < ApplicationJob
  queue_as :default

  def perform(post)
    # Do something later
    return if post.published?

    return if post.publish_at > Time.current

    post.publish_to_twitter!
  end
end
