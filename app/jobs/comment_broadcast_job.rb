class CommonBroadcastJob < ApplicationJob
	queue_as :default
	# backlog/list 
	def perform(comment)
		ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
		# Broadcast on action cable and channel to by blog by its id - different channels that users are on
	end

	private

	def render_comment(comment)
		CommentsController.render partial: 'comments/comment', locals: { comment: comment }
	end
end