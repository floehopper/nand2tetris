require 'minitest/autorun'
require 'open3'

SCRIPT = File.expand_path(File.join('..', 'tools', 'HardwareSimulator.sh'))

class HardwareSimulatorTest < Minitest::Test
  Dir['01/*.tst', '02/*.tst', '03/**/*.tst'].map do |test_file|
    define_method "test_#{File.basename(test_file, '.tst')}" do
      command = "#{SCRIPT} #{test_file}"
      output, status = Open3.capture2e(command)
      assert status.success?, output
    end
  end
end
