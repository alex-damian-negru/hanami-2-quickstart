# frozen_string_literal: true

require 'rom/sql/rake_task'

desc 'Setup app environment'
task :environment do
  require_relative 'config/app'
  require 'hanami/prepare'
end

namespace :db do
  desc 'Setup database environment'
  task setup: :environment do
    Hanami.app.prepare :persistence
    ROM::SQL::RakeSupport.env = Hanami.app['persistence.config']
  end
end
