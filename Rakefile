SCRIPT = File.expand_path(File.join('..', 'tools', 'HardwareSimulator.sh'))

def test(test_file)
  command = "#{SCRIPT} #{test_file}"
  output, status = Open3.capture2e(command)
  result = status.success? ? '[PASS]' : '[FAIL]'
  puts "#{test_file.ljust(40)}#{result}"
  unless status.success?
    puts output
  end
end

task default: :test

task :test do
  Dir['01/*.tst', '02/*.tst', '03/**/*.tst'].each do |test_file|
    test(test_file)
  end
end
