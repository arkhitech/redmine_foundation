class BootstrapHooks < Redmine::Hook::ViewListener
  render_on(:view_layouts_base_html_head, :partial => 'hooks/redmine_foundation_theme/css')
end


