# frozen_string_literal: true

require 'pry'

# Set Pry theme
Pry.config.theme = 'tomorrow-night'
# Other (IMHO) good looking pry-themes:
# "vividchalk", "railscasts", "github", "solarized"
# "pry-zealand-16", "tomorrow", "pry-modern", "monokai"

# Configure Pry's prompt, showiung current Ruby and Rails versions
# Rails version is shown after you require 'rails'
# Pry.config.prompt = proc do |obj, _level, _|
#   prompt = ''
#   prompt << "#{Rails.version}@" if defined?(Rails)
#   prompt << RUBY_VERSION.to_s
#   "#{prompt} (#{obj})> "
# end

# Using Rails, I include some utilities
if defined?(Rails)
  begin
    require 'rails/console/app'
    require 'rails/console/helpers'
  rescue LoadError => e
    puts e
    require 'console_app'
    require 'console_with_helpers'
  end
end

# Shortcuts for debugging commands
begin
  Pry.commands.alias_command 'cc', 'continue'
rescue StandardError
  nil
end
begin
  Pry.commands.alias_command 'ss', 'step'
rescue StandardError
  nil
end
begin
  Pry.commands.alias_command 'nn', 'next'
rescue StandardError
  nil
end
begin
  Pry.commands.alias_command 'ff', 'finish'
rescue StandardError
  nil
end
begin
  Pry.commands.alias_command 'r!', 'reload!'
rescue StandardError
  nil
end
begin
  Pry.commands.alias_command 'sh', 'show-source'
rescue StandardError
  nil
end

# Hit Enter to repeat last command
Pry::Commands.command(/^$/, 'repeat last command') do
  # _pry_.run_command Pry.history.to_a.last
  pry_instance.run_command Pry.history.to_a.last
end

# ===================
# Custom Pry aliases
# ===================
Pry.config.commands.alias_command 'ww', 'whereami'
# Clear Screen
Pry.config.commands.alias_command '.cls', '.clear'

# ===================
# Removes ^A^B from console output
ENV['PAGER'] = ' less --raw-control-chars -F -X'

# Return only the methods not present on basic objects
class Object
  def bryam_pry_methods
    [
      'bryam',
      'user_email(email)',
      'utc_to_zone(utc_time)',
      'caller_match(word = nil)',
      'clear_jobs',
      'clear_all_workers',
      'pbcopy',
      'remove_escapes'
    ]
  end

  def user_email(email = nil)
    User.find_by(email:)
  end

  def utc_to_zone(utc_time, zone = :pacific)
    time_zone =
      if zone == :central
        'Central Time (US & Canada)'
      else
        'Pacific Time (US & Canada)'
      end

    date_time = DateTime.parse(utc_time)
    time = Time.zone.parse(date_time.to_s)
    time.in_time_zone(time_zone)
  end

  def bryam
    @bryam ||= User.find_by(email: 'bryamnoguera@threeflow.com')
  end

  def caller_match(word = 'threeflow')
    caller.select { |line| line.match?(/#{word}/) }
  end

  def clear_jobs
    Sidekiq::ScheduledSet.new.clear
    Sidekiq::RetrySet.new.clear
    Sidekiq.redis {|c| c.del('stat:failed') } # reset failed counters
  end

  def clear_all_workers
    Sidekiq.redis { |conn| conn.flushdb } # rubocop:disable Style/SymbolProc
  end

  def pbcopy(obj)
    IO.popen('pbcopy', 'w') { |pipe| pipe.puts obj }
  end

  def remove_escapes(str)
    str.delete('"')
  end
end

# Load and execute a Ruby source file
# def run_ruby_file(fn)
#   fn += '.rb' unless fn =~ /\.rb/
#   @@recent = fn
#   load "#{fn}"
# end

# Reload and excute the most recently loaded ruby source file
# def reload
#   run_ruby_file(@@recent)
# end

# Display only filenames in multiple column format
# def list_files_columns
#   op = %x{ ls -aC }
#   op.gsub!('\t','\n')
#   puts op
# end

# List all files in filename order
# def list_files_by_name
#   puts `ls -la`.split("\n")
# end

# List all files by size from smallest to largest
# def list_files_by_size
#   puts `ls -la -S -r`.split("\n")
# end

# List only directories
# def list_directories
#   puts `ls -la | egrep "^d"`
# end

# List all files by date
# def list_files_by_date
#   puts `ls -la --sort=t -r -p`
# end

# List only filenames, one per line, in alpha order
# def list_filenames
#   puts `ls -aF`
# end

# Print (current) working directory
# def pwd
#   `pwd`.rstrip
# end

# List gems matching search parameter
# def search_gem(str)
#   puts `gem list | sort | grep #{str}`
# end
#
# Display execution timing
# def benchmark_time
#   require 'benchmark'
#   res = nil
#   timing = Benchmark.measure do
#     res = yield
#   end
#   puts 'Using yield, it took:     user       system     total       real'
#   puts "                      #{timing}"
#   res
# end

# Display current PATH
# def path
#   `echo $PATH`
# end

# Display process list
# def pss
#   op = `ps --context ax`
#   puts op
# end

# Show the system date and time
# def datetime
#   puts `date`
# end

# List current startup info for services
# def startup_services
#   puts `/sbin/chkconfig --list`
# end

# List all pci devices
# def list_pci
#   puts `lspci`
# end

# List all usb devices
# def list_usb
#   puts `lsusb`
# end

# Show methods defined in .pryrc
# This depends heavily on the format of
# method definitions. A single comment
# line, followed by the method 'def <method>'
# line will include any new methods in this
# method summary.
# def defined_methods
#   res = []
#   save_comment = ''
#   data = `cat ~/.pryrc`
#   str_arr = data.split("\n")
#
#   puts 'Pry custom commands defined in .pryrc:'
#   counter = 0
#
#   until str_arr[counter].nil?
#     # Ruby 1.9 returns an ordinal rather than a character, so...
#     if str_arr[counter][0] == '#' || str_arr[counter][0] == 35
#       save_comment = str_arr[counter]
#     elsif str_arr[counter].index('def') == 0
#       m = str_arr[counter].gsub('def ', '')
#       m.chomp
#
#       # output so columns are aligned
#       res << if m.length < 8
#                (m + "\t   " + save_comment + "\n")
#              else
#                (m + '   ' + save_comment + "\n")
#              end
#
#       m = ''
#       save_comment = ''
#     end
#     counter += 1
#   end
#   res.sort!
#   0.upto(counter) do |x|
#     print res[x]
#   end
# end

# Display text file contents
# def cat_filename(f)
#   puts `cat #{f}`
# end

# When opening pry, show summary of methods defined
# defined_methods
