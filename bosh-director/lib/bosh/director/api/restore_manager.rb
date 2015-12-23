module Bosh::Director
  module Api
    class RestoreManager
      def initialize
        @logger = Config.logger
        @db_config = Config.db_config
      end

      def restore_db(path)
        @logger.debug("Restoring database from db_dump file: #{path}...")

        db_name = @db_config.fetch('database')
        adapter = @db_config.fetch('adapter')
        user = @db_config.fetch('user')
        pass = @db_config.fetch('password')
        host = @db_config.fetch('host')

        Process.spawn('sudo restore-db', adapter, host, user, pass, db_name, backup_file, out: '/dev/null')
      end
    end
  end
end
