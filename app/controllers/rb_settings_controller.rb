include RbCommonHelper
include ProjectsHelper

class RbSettingsController < RbApplicationController
  unloadable

  def projectsettings
    enabled = false
    if request.post? and params[:settings] and params[:settings]["show_stories_from_subprojects"]=="enabled"
      enabled = true
    end
    settings = @project.rb_projectsettings
    settings.show_stories_from_subprojects = enabled
    if settings.save
      flash[:notice] = t(:rb_settings_updated)
    else
      flash[:error] = t(:rb_settings_update_error)
    end
    redirect_to :controller => 'projects', :action => 'settings', :id => @project,
                :tab => 'backlogs'
  end

end
