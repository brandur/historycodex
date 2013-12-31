require "bundler/setup"
Bundler.require

# so logging output appears properly
$stdout.sync = true

require "./lib/codex"

# configuration
Slim::Engine.set_default_options format: :html5, pretty: true

run Codex::Main
