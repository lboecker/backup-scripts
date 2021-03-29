bin_dir=/usr/local/bin
unit_dir=/etc/systemd/system

scripts = system-backup package-list-backup
script_targets := $(foreach script,$(scripts),$(bin_dir)/$(script))
timer_units := $(foreach script,$(scripts),$(unit_dir)/$(script).timer)
service_units := $(foreach script,$(scripts),$(unit_dir)/$(script).service)

.phony: install uninstall

install: $(script_targets) $(timer_units) $(service_units)

$(bin_dir)/%: %
	install -m 755 $^ $@

$(unit_dir)/%: %
	install -m 644 $^ $@

uninstall:
	rm -f $(script_targets) $(timer_units) $(service_units)
