class FeedbacksController < ApplicationController
	skip_before_action :authenticate_user!

	def new
	  @feedback = Feedback.new
	end

	def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to new_feedback_path, notice: 'Thank you for your feedback!' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

	def index
		@feedbacks=Feedback.all
	end

	def feedback_params
     params.require(:feedback).permit(:name, :rating , :comment)
   end
end
