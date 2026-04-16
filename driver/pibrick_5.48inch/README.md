# piBrick Driver

## Install

**Interactive (will prompt for screen size):**
```bash
curl -sSL https://raw.githubusercontent.com/doivedau1905/piBrick/main/get.sh | sudo bash
```

**Specify screen size (latest version):**
```bash
# 3.92 inch
curl -sSL https://raw.githubusercontent.com/doivedau1905/piBrick/main/get.sh | sudo bash -s -- 3.92inch

# 5.48 inch
curl -sSL https://raw.githubusercontent.com/doivedau1905/piBrick/main/get.sh | sudo bash -s -- 5.48inch
```

**Specify screen size + version:**
```bash
curl -sSL https://raw.githubusercontent.com/doivedau1905/piBrick/main/get.sh | sudo bash -s -- 3.92inch v1
```

## Versions

| Version | 3.92inch | 5.48inch |
|---------|----------|----------|
| v1      | ✓        | ✓        |
| v2      | ✓        | ✓        |

## GitHub Releases structure

Each release tag contains:
```
pibrick_3.92inch.zip
pibrick_5.48inch.zip
```

## Manual install (SD card method)

1. Download the zip for your screen from [Releases](https://github.com/doivedau1905/piBrick/releases)
2. Copy the folder to `bootfs` on your SD card
3. Eject and attach to piBrick
4. Power on, open Terminal and run:
   ```bash
   cd /boot/firmware/pibrick
   sudo bash ./install.sh
   ```
"# piBrick" 
