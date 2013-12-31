module Codex
  class Timeline < Sinatra::Base
    configure do
      set :views, Config.root + "/views"
    end

    get "/timeline" do
      slim :timeline
    end
  end
end
