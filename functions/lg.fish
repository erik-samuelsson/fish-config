function lg --wraps=lazygit --wraps='echo "foo" | gpg --sign -u erik.samuelsson@northvolt.com > /dev/null; lazygit' --description 'alias lg echo "foo" | gpg --sign -u erik.samuelsson@northvolt.com > /dev/null; lazygit'
  echo "foo" | gpg --sign -u erik.samuelsson@northvolt.com > /dev/null; lazygit $argv
        
end
