require 'spec_helper'

module Bosh::Director
  describe Api::RestoreManager do
    let(:restore_manager) { described_class.new }

    let(:config) { Config.load_hash(test_config) }
    let(:test_config) do
      config = Psych.load(spec_asset('test-director-config.yml'))
      config['db'].merge!({
          'user' => 'fake-user',
          'password' => 'fake-password',
          'host' => 'fake-host',
        })
      config
    end

    before { App.new(config) }

    describe '#restore_db' do
      it 'spawns a process to restore DB' do
        expect(Process).to receive('sudo restore-db')
        restore_manager.restore_db('/path/to/db_dump.tgz')
      end
    end
  end
end
