class DelayedJobsController < ApplicationController
	def get_progress
		job = Delayed::Job.find_by_id(params[:id])
		@progress = job && job.failed_at.nil? ? job.progress : -1
	end
end
