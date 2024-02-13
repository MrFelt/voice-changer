# **IF YOU ARE NOT USING 9xx-40xx NVIDIA, THIS WILL NOT WORK FOR YOU.**

# Step 1:
acquire bat -> https://github.com/MrFelt/voice-changer/releases

# Step 2:
install -> https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe

install -> https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe

install -> https://aka.ms/vs/17/release/vs_BuildTools.exe **with the optional boxes named "MSVC VS 2022" and "Windows 11 SDK"** (i totally just, didn't forget which is actually needed for the ratty package called fairseq)


# Step 3:
put bat in your **user folder**, run it, it will have a **press any key to continue**, then **ask you if it is your first time** (this is to install requirements and also to skip installing requirements every time you launch)

# Step 4:
use a **chromium** based browser, my recommendation, use top one because it is the latest -> https://ungoogled-software.github.io/ungoogled-chromium-binaries/releases/windows/64bit

use for auto updating -> https://github.com/henrypp/chrlauncher


# Step 5:
open your chrome browser, go to **chrome://flags/**

search audio, disable the two following: Allow WebRTC to adjust the input volume, Chrome-wide echo cancellation


# Step 6:
go to url bar, type https:127.0.0.1:18888

ignore the warning, click advanced, then continue, this is because it is an unsigned https certificate, that you created by running it on your own pc


# Step 7:
eat ur heart out, do not come to me with an issue if you are not going to document all the info required to attempt to fix it, and do not pester me outside of github
