# This is for automatically compiling .coffee to .js 
watch('koans\/.*\.coffee') do |match|
  system "cake build"
  uri = File.expand_path(File.dirname(__FILE__) + '/browser_reloader.sh')
  puts `#{uri}`
end

# This compiles the completed koans dir 
# I'm using this for testing
watch('completed-koans\/.*\.coffee') {|match| system "cake test"}
