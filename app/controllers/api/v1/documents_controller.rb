class Api::V1::DocumentsController < ApplicationController
  # GET /documents
  def index
    @documents = Document.all
    render json: @documents
  end

  # GET /documents/:id
  def show
    @document = Document.find(params[:id])
    render json: @document
  end

  # POST /documents
  def create
    @document = Document.new(document_params)
    if @document.save
      render json: @document
    else
      render error: { error: 'Unable to create Document' }, status: 400
    end
  end

  # PUT /documents/:id
  def update
    @document = Document.find(params[:id])
    if @document
      @document.update(document_params)
      render json: { message: 'Document successfully updated' }, staus: 200
    else
      render error: { error: 'Unable to update Document' }, status: 400
    end
  end

  # DELETE /documents/:id
  def delete
    @document = Document.find(params[:id])
    if @document
      @document.destroy
      render json: { message: 'Document successfully deleted' }, status: 200
    else
      render error: { error: 'Unable to delete Document' }, status: 400
    end
  end

  private

  def document_params
    params.require(:document).permit(:title)
  end
end
