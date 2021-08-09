class CommonPagesController < ApplicationController

  def home
  end

  def pricing
  end

  def dashboard
    @page = Page.dashboard
  end
end
