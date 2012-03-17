class ProgramProvidersController < ApplicationController

	def new
		@program_provider = ProgramProvider.new
	end

	def create
		@program_provider = ProgramProvider.new(params[:program_provider])
		@program_provider.save
		flash[:success] = "Program successfully created"
	end

	def index
		@program_providers = ProgramProvider.paginate(:page => params[:page], :per_page => 10)
	end

	def show
		@program_provider = ProgramProvider.find(params[:id])
	end

	def destroy
	end
end
