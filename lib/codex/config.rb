require "cgi"

module Codex
  module Config
    extend self

    def production?
      env("RACK_ENV") == "production"
    end

    def release
      env("RELEASE") || "1"
    end

    def root
      File.expand_path("../../../", __FILE__)
    end

    private

    def env(k)
      ENV[k] if ENV[k] != ""
    end

    def env!(k)
      env(k) || raise("missing_environment=#{k}")
    end
  end
end
