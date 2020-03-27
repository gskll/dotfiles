# function to mkdir and immediately cd
function take
  mkdir -p $argv
  cd $argv
end
