require_dependency 'projects_helper'

module FoundationProjectsHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :render_project_hierarchy, :foundation
      alias_method_chain :render_project_action_links, :foundation
    end
  end
  
  module InstanceMethods
    def render_project_action_links_with_foundation
      links = []
      links << link_to(l(:label_project_new), {:controller => 'projects', :action => 'new'}) if User.current.allowed_to?(:add_project, nil, :global => true)
      links << link_to(l(:label_issue_view_all), issues_path) if User.current.allowed_to?(:view_issues, nil, :global => true)
      links << link_to(l(:label_overall_spent_time), time_entries_path) if User.current.allowed_to?(:view_time_entries, nil, :global => true)
      links << link_to(l(:label_overall_activity), { :controller => 'activities', :action => 'index', :id => nil })
      links.join(" | ").html_safe
    end
    
    # Renders the projects index
    def render_project_hierarchy_with_foundation(projects)
      render_project_nested_lists(projects) do |project|
        s = content_tag('i', '', :class => 'fi-star custom_left')
        s << link_to_project(project, {}, :class => "custom_left #{project.css_classes} #{User.current.member_of?(project) ? 'my-project' : nil}")
        if project.description.present?
          s << content_tag('div', textilizable(project.short_description, :project => project), :class => 'wiki description')
        end
        s
      end
    end
  end
end

ProjectsHelper.send(:include, FoundationProjectsHelperPatch)