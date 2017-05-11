class CommentBroadcastJob < ApplicationJob
	queue_as :default
	def perform(comment)
		ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
		# Broadcast on action cable and channel to by blog by its id - different channels that users are on
	end
	# this perform method will tell Jobs what type of specific job to perform 

	private

	def render_comment(comment)
		CommentsController.render partial: 'comments/comment', locals: { comment: comment }
		# this communicates with the rails app
	end
end