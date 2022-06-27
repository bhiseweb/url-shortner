class LinksController < ApplicationController
  before_action :set_link, only: %i[ show edit update destroy ]
  before_action :find_link, only: %i[ explore ]
  before_action :authenticate_user!, except: %i[explore]

  # GET /links or /links.json
  def index
    @links = current_user.links
  end

  # GET /links/1 or /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = current_user.links.new
  end

  # POST /links or /links.json
  def create
    @link = current_user.links.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to link_url(@link), notice: "Link was successfully created." }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def explore
    if @link.present?
      redirect_to @link.main_url, allow_other_host: true
    else
      redirect_to '/404'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    def find_link
      @link = Link.find_by(token: params[:token])
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:main_url, :token)
    end
end
