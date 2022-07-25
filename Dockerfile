FROM alpine:edge

#update packages
RUN apk update

#add software
RUN apk add zsh
RUN apk add neovim
RUN apk add git
RUN apk add stow
RUN apk add starship
RUN apk add zoxide
RUN apk add alpine-sdk cmake sqlite
RUN apk add python3
RUN apk add fzf
RUN apk add fzf-neovim
RUN apk add lf

#add my config
RUN git clone --depth 1 https://github.com/Jari576/.dotfiles.git /root/.dotfiles
RUN stow -d /root/.dotfiles .

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
CMD [ "/bin/zsh" ]
