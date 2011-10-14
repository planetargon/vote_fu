RAILS_DEFAULT_LOGGER.info "** vote_fu: setting up load paths"

%w{ models controllers helpers }.each do |dir|
  path = File.join(File.dirname(__FILE__) , 'lib', dir)
  $LOAD_PATH << path
  if ActiveSupport::Dependencies.respond_to?(:autoload_paths)
    ActiveSupport::Dependencies.autoload_paths << path
  else
    ActiveSupport::Dependencies.load_paths << path
  end

  if ActiveSupport::Dependencies.respond_to?(:autoload_once_paths)
    ActiveSupport::Dependencies.load_once_paths.delete(path)
  else
    ActiveSupport::Dependencies.autoload_once_paths.delete(path)
  end
end

require 'vote_fu'