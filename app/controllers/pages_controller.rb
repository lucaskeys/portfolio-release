class PagesController < ApplicationController
  def home
  	@skills = Skill.all
  	@blogs = Blog.all
  end

  def about
  	@skills = Skill.all
  end

  def contact
  end
end
