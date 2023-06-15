# git prompt
# from http://gist.github.com/47364
function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "⚡"
}
function git_prompt {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\[\e[1;33m\]\W\[\e[1;36m\]$(git_prompt)\[\e[1;33m\]$\[\e[m\] '

