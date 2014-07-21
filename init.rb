require 'redmine'
require 'foundation_hooks'
require 'foundation_projects_helper_patch'

Redmine::Plugin.register :redmine_foundation_theme do
  name 'Foundation Theme plugin'
  author 'Arkhitech'
  description 'This is a foundation theme plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/arkhitech/redmine_foundation_theme'
  author_url 'http://www.arkhitech.com'
end
