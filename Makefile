# Run `make build install-fennel-ls`

build: $(HOME)/.config/lite-xl/libraries/widget; ./build-packages.sh

$(HOME)/.config/lite-xl/libraries/widget:
	mkdir -p $(HOME)/.config/lite-xl/libraries/
	cp -r data/libraries/widget $@

fennel-ls:
	git clone https://git.sr.ht/~xerool/fennel-ls

install-fennel-ls:
	make -C fennel-ls
	sudo make -C fennel-ls install

.PHONY: build install-fennel-ls
