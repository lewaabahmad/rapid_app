class CommonPagesController < ApplicationController

  def homepage
    @page = Page.homepage
  end

  def dashboard
    @page = Page.dashboard
  end
end
