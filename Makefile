# Run: make && make fennel-ls && sudo make install

DESTDIR ?=
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

BIN=lite-xl/bin/lite-xl

$(BIN): $(HOME)/.config/lite-xl/libraries/widget; ./build-packages.sh

$(HOME)/.config/lite-xl/libraries/widget:
	mkdir -p $(HOME)/.config/lite-xl/libraries/
	cp -r data/libraries/widget $@

install: $(BIN) fennel-ls/fennel-ls
	mkdir -p $(DESTDIR)$(BINDIR) && cp $< $(DESTDIR)$(BINDIR)/
	mkdir -p $(PREFIX)/share/applications
	cp resources/linux/org.lite_xl.lite_xl.desktop $(PREFIX)/share/applications
	sudo make -C fennel-ls install

fennel-ls:
	git clone https://git.sr.ht/~xerool/fennel-ls

fennel-ls/fennel-ls: fennel-ls
	make -C fennel-ls

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/lite-xl
	rm -f $(PREFIX)/share/applications/org.lite_xl.lite_xl.desktop
	rm -f $(DESTDIR)$(BINDIR)/fennel-ls

.PHONY: install uninstall
