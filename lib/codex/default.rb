module Codex
  class Default < Sinatra::Base
    get "/" do
      redirect to("/timeline")
    end

    not_found do
      404
    end
  end
end
