require 'bosh/director/core/tar_gzipper'

module Bosh::Director
  module Jobs
    class Restore < BaseJob
      @queue = :normal

      def self.job_type
        :bosh_restore_db
      end

      def initialize(backup_file, options={})
        @backup_file = backup_file
        @db_config = Config.db_config
      end

      def perform
        track_and_log('Restoring database') do
          db_name = @db_config.fetch('database')
          adapter = @db_config.fetch('adapter')
          user = @db_config.fetch('user')
          pass = @db_config.fetch('password')
          host = @db_config.fetch('host')

          Bosh::Exec.sh(
            "sudo restore-db #{adapter} #{host} #{user} #{pass} #{db_name} #{@backup_file} >/Users/dongdong/log 2>&1",
            :on_error => :return
          )
        end
      end
    end
  end
end
