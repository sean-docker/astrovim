FROM alpine:3.15.4
RUN apk add git fzf bash make nerd-fonts
RUN apk add neovim --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN  adduser -Ds /bin/bash astro
USER astro
WORKDIR /home/astro
RUN git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' #Thanks to https://github.com/wbthomason/packer.nvim/issues/198#issuecomment-888079312
