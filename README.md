# Backup Scripts

![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/lboecker/backup-scripts/CI/main?label=ci)

## Install

```sh
make install

systemctl enable --now system-backup.timer
systemctl enable --now package-list-backup.timer
```

## Uninstall

```sh
systemctl disable --now system-backup.timer
systemctl disable --now package-list-backup.timer

make uninstall
```
