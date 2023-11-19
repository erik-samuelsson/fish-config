function fish_right_prompt -d "Write out the right prompt"
    if git rev-parse --abbrev-ref HEAD 1>/dev/null 2>/dev/null; git rev-parse --abbrev-ref HEAD; end
end
