require 'redmine'
require 'bootstrap_hooks'
require 'application_helper_patch'
require 'settings_helper_patch'

Redmine::Plugin.register :redmine_foundation_theme do
  name 'Foundation Theme plugin'
  author 'Arkhitech'
  description 'This is a foundation theme plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
