# WINDOWS BUILD NOTES

Below are some notes on how to build jetson-containers on Windows.

The options known to work for building jetson-containers on Windows are:

* On Windows using [Windows
Subsystem for Linux (WSL) v2](https://docs.microsoft.com/en-us/windows/wsl/wsl2-about?WT.mc_id=github-jetsoncontainers-pdecarlo)

## Installing Windows Subsystem for Linux

With Windows 10, Microsoft has released a new feature named the [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/about?WT.mc_id=github-jetsoncontainers-pdecarlo). This feature allows you to run a bash shell directly on Windows in an Ubuntu-based environment. Within this environment you can cross compile images for AARCH64 without the need for a separate Linux VM or server. Note that while WSL can be installed with other Linux variants, such as OpenSUSE, the following instructions have only been tested with Ubuntu.

This feature is not supported in versions of Windows prior to Windows 10. In addition, it is available only for 64-bit versions of
Windows.

Full instructions to install WSL are available at [the official Microsoft Docs page for WSL](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide?WT.mc_id=github-jetsoncontainers-pdecarlo).

To install WSL on Windows 10 with Fall Creators Update installed (version >= 16215.0) do the following:

1. Enable the Windows Subsystem for Linux feature
  * Open the Windows Features dialog (`OptionalFeatures.exe`)
  * Enable 'Windows Subsystem for Linux'
  * Click 'OK' and restart if necessary
2. Install Ubuntu
  * Open Microsoft Store and search for "Ubuntu 18.04" or use [this link](https://www.microsoft.com/store/productId/9N9TNGVNDL3Q)
  * Click Install
3. Complete Installation
  * Open a cmd prompt and type "Ubuntu1804"
  * Create a new UNIX user account (this is a separate account from your Windows account)

# Upgrade Windows Subsystem for Linux to v2

WSL 2 is a new version of the architecture that powers the Windows Subsystem for Linux to run ELF64 Linux binaries on Windows. Its primary goals are to increase file system performance, as well as adding full system call compatibility. This new architecture changes how these Linux binaries interact with Windows and your computer’s hardware, but still provides the same user experience as in WSL 1 (the current widely available version). Individual Linux distros can be run either as a WSL 1 distro, or as a WSL 2 distro, can be upgraded or downgraded at any time, and you can run WSL 1 and WSL 2 distros side by side. WSL 2 uses an entirely new architecture that uses a real Linux kernel.

Support for WSL v2 requires installation of WSL v1 as instructed in the previous section.

Full instructions for upgrading to WSL v2 are available at [the official Microsoft Docs page for WSL v2](https://docs.microsoft.com/en-us/windows/wsl/wsl2-install?WT.mc_id=github-jetsoncontainers-pdecarlo).
To install WSL v2 on Windows 10 (version >= 18917.0) do the following:

1. Enable the Virtual Machine Platform feature
  * Open the Windows Features dialog (`OptionalFeatures.exe`)
  * Enable 'Virtual Machine Platform'
  * Click 'OK' and restart if necessary
2. Set Ubuntu1804 to be backed by WSL 2
  * Open Powershell and run:
    ``` 
    wsl --set-version Ubuntu-18.04 2
    ```
3. Verify Ubuntu-18.04 is using WSL v2
    * Open Powershell and run:
    ``` 
    wsl --list --verbose
    ```
  * Verify that the output looks like this:
    ```
      NAME            STATE           VERSION
    * Ubuntu-18.04    Running         2
    ```

After confirming that you are running Ubuntu-18.04 using WSL v2, you are ready to begin following the "Cross-Compilation" steps below.


## Setup Cross-Compilation Environment on Ubuntu using Windows Subsystem for Linux v2

We will use the Ubuntu 18.04 WSL v2 environment to cross-compile AARCH64 compatible jetson-containers images capable of running on Nvidia Jetson hardware.

1. Install the Nvidia SdkManager into the WSL v2 Environment
  * From your Windows host OS, obtain the .deb installer for the Nvidia SdkManager from [developer.nvidia.com](https://developer.nvidia.com/nvidia-sdk-manager)

    Note: This requires that you have valid registered account @ developer.nvidia.com

  * Place the downloaded .deb installer into c:\sdkmanager

  * Open a WSL v2 compatible instance of Ubuntu-18.04 

  * Install the sdkmanger by running the following on the bash prompt of the WSL v2 instance:

    ```
    sudo apt update
    sudo apt install -y  libcanberra-gtk-module libgconf-2-4 libgtk-3-0 libxss1 libnss3 xvfb  
    sudo dpkg -i /mnt/c/sdkmanager/sdkmanager_*.deb
    ```

2. Install Cross-Compilation tools for AARCH64 support

  * Install the dependencies needed for cross-compilation by running the following on the bash prompt of the WSL v2 instance:

    ```
    sudo apt install -y build-essential qemu-user-static binfmt-support

    ```

3. Install Docker

  * Install a Linux-native instance of Docker by running the following on the bash prompt of the WSL v2 instance:

    ```
    sudo apt install -y curl
    curl -fsSL https://get.docker.com | bash
    ```

## Building Jetson Containers using Windows Subsystem for Linux and Visual Studio Code

After you have setup the Cross-Compilation environment on Ubuntu using Windows Subsystem for Linux v2, you are now ready to beging building jetson-containers.

1. Configure Visual Studio Code

  * Install [Visual Studio Code](https://code.visualstudio.com/Download?WT.mc_id=github-jetsoncontainers-pdecarlo) onto the Windows host OS
  * Install and enable the [Remote WSL extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) from the Visual Studio Marketplace

2. Start docker and binfmt-support services
* These services must be manually started each time a new instance of WSL v2 is started on the host machine.  To start them, execute the following on the bash prompt of the WSL v2 instance:

  ```
  sudo service docker start
  sudo service binfmt-support start
  ```

3. Clone jetson-containers project into WSL v2 environment and Open in VS Code

* Clone the jetson-containers project and open in VS Code by running the following on the bash prompt of the WSL v2 instance:

  ```
  git clone https://github.com/idavis/jetson-containers.git
  cd jetson-containers
  code .
  ```

3. Run build tasks in VS Code to create jetson-containers images

  * In the previous step, a new Visual Studio Code instance should have opened.  Inside of the VS Code instance, press "CTRL+SHIFT++B" to bring up a list of available build tasks and select one to begin building the associated jetson-containers image(s)
