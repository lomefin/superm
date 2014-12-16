###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  activate :gzip
  activate :minify_html
  activate :imageoptim do |io|
    io.pngout_options = false
    io.advpng_options = false
    io.jpegtran_options = false
  end
  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :sync do |sync|
  sync.fog_provider = 'Rackspace' # Your storage provider
  sync.fog_directory = 'superm' # Your bucket name
  sync.fog_region = 'dfw' # The region your storage bucket is in
  sync.rackspace_username = 'soloteatrocl' # Your Rackspace username
  sync.rackspace_api_key = 'ec6fee5be2ef43840074ac236003a910' # Your Rackspace API Key
  sync.existing_remote_files = 'keep' # What to do with your existing remote files? ( keep or delete )
  sync.gzip_compression = true # Automatically replace files with their equivalent gzip compressed version
  # sync.rackspace_auth_url = 'domain' # Your Rackspace auth URL
  # sync.after_build = false # Disable sync to run after Middleman build ( defaults to true )
end
