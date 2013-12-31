module Codex
  Main = Rack::Builder.new do
    use Rack::Deflater

    run Sinatra::Router.new {
      mount Codex::Assets
      mount Codex::Timeline
      run Codex::Default
    }
  end
end
