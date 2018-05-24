class DocsController < ApplicationController
	before_action :find_doc, only: [:update, :show, :destroy, :edit]

	def index
		@docs=Doc.where(user_id: current_user)
	end

	def create
		@doc=current_user.docs.build(doc_params)

		if @doc.save
			redirect_to @doc
		else
			render 'new'
		end
	end

	def new
		@doc=current_user.docs.build
	end

	def update
		if @doc.update(doc_params)
			redirect_to @doc
		else
			render 'edit'
		end
	end

	def destroy
		@doc.destroy
		redirect_to docs_path
	end

	def edit
	end

	def show
	end

	private

		def find_doc
			@doc = Doc.find(params[:id])
		end

		def doc_params
			params.require(:doc).permit(:title,:content)
		end
end