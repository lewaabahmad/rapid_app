class CommonPagesController < ApplicationController

  def home
  end

  def pricing
  end

  def dashboard
    @page = Page.find_by(is_dashboard: true)
    @page = Page.generate_dashboard unless @page
  end
end
