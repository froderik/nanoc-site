require 'warning'
Warning.ignore([:fixnum, :bignum])

def indent_for_dmark(num, s)
  indent = '  ' * num
  s.lines.map { |l| indent + l }.join("\n")
end

def kramdown2dmark(s)
  document = ::Kramdown::Document.new(s, {})

  document.warnings.each do |warning|
    $stderr.puts "kramdown warning: #{warning}"
  end

  document.to_nanoc_ws_dmark
end