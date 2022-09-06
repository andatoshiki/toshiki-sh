# launch zsh shell at every git bash startups (default)
if [ -t 1 ]; then
     exec zsh
fi    
