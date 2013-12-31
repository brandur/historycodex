module Codex
  class Assets < Sinatra::Base
    def initialize(*args)
      super
      path = "#{Config.root}/assets"
      @assets = Sprockets::Environment.new do |env|
        env.append_path(path + "/images")
        env.append_path(path + "/javascripts")
        env.append_path(path + "/stylesheets")

        if Config.production?
          env.js_compressor  = YUI::JavaScriptCompressor.new
          env.css_compressor = YUI::CssCompressor.new
        end
      end
    end

    get "/assets/:release/app.css" do
      respond_with_asset(@assets["app.css"])
    end

    get "/assets/:release/app.js" do
      respond_with_asset(@assets["app.js"])
    end

    %w{jpg png}.each do |format|
      get "/assets/*.#{format}" do |image|
        respond_with_asset(@assets["#{image}.#{format}"])
      end
    end

    private

    def respond_with_asset(asset)
      halt(404) unless asset
      cache_control(:public, max_age: 2592000)
      content_type(asset.content_type)
      last_modified(asset.mtime.utc) if Config.production?
      asset
    end
  end
end
