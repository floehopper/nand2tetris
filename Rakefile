SCRIPT = File.expand_path(File.join('..', 'tools', 'HardwareSimulator.sh'))

def test(test_file)
  command = "#{SCRIPT} #{test_file}"
  output, status = Open3.capture2e(command)
  result = status.success? ? '[PASS]' : '[FAIL]'
  spacing = ' ' * (40 - test_file.length)
  puts "#{test_file}#{spacing}#{result}"
  unless status.success?
    puts output
  end
end

task default: :test

task :test do
  Dir['01/*.tst', '02/*.tst'].each do |test_file|
    test(test_file)
  end
end
