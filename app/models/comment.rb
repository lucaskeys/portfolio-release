class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minimum: 5, maximum: 1000 }

  after_create_comment { CommentBroadcastJob.perform_later(self) }
  # commentBroadcastJobs is located in jobs folder
  # call commentBoradcastJob - performLater - perform this whenever there is a chance but it doesnt have to be this second
end
