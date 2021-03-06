class PagesController < ApplicationController
  before_action :set_page, only: %i[edit update destroy]
  before_action :authenticate_admin!, except: %i[show]

  # GET /pages or /pages.json
  def index
    @homepage = Page.homepage
    @dashboard = Page.dashboard
    pages = Page.all.where(is_dashboard: false, is_homepage: false)
    @public_pages = pages.where(requires_authentication: false)
    @private_pages = pages.where(requires_authentication: true)
  end

  # GET /pages/1 or /pages/1.json
  def show
    @page = Page.find_by(url: params[:url])
    not_found unless @page
    authenticate_user! if @page.requires_authentication?
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages or /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: "Page was successfully created." }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to edit_page_path(@page), notice: "Page was successfully updated." }
        format.json { render :edit, status: :ok, location: @page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: "Page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title, :description, :is_homepage, :is_dashboard, :requires_authentication, :header_html, :is_in_nav, :body_html, :url)
    end
end
