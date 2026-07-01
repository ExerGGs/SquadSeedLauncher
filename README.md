# Squad Seeding Launcher

![Windows](https://img.shields.io/badge/Windows-10%2F11-0078D4?style=for-the-badge&logo=windows&logoColor=white)
![Squad](https://img.shields.io/badge/Built%20for-Squad-111111?style=for-the-badge)
![Installer](https://img.shields.io/badge/Install-Run%20the%20EXE-2EA44F?style=for-the-badge)

A lightweight Windows launcher for seeding in **Squad**.

It temporarily swaps your normal Squad graphics/settings for a low-performance-cost profile, launches Squad, then restores everything after the game closes.

Built for and shared by **Forward Operating Idiots**.

- Website: [forwardoperatingidiots.com](https://forwardoperatingidiots.com)
- Discord: [discord.forwardoperatingidiots.com](https://discord.forwardoperatingidiots.com)

## Quick Install

1. Download the latest `SquadSeedingSetup.exe`.
2. Run the file.
3. Approve the Windows security prompt if one appears.
4. Use the new **Squad Seeding** shortcut on your Desktop or Start Menu.

That is it. You do not need to manually copy `.ini` files or edit your Squad settings folder.

## What It Does

When you launch Squad through **Squad Seeding Launcher**, it:

1. Finds your Squad settings folder.
2. Backs up your current `GameUserSettings.ini`.
3. Applies the bundled low settings profile.
4. Saves your current Windows power plan.
5. Switches Windows to **Power saver** mode.
6. Launches Squad through Steam.
7. Waits until Squad closes.
8. Restores your original Squad settings.
9. Restores your original Windows power plan.

## Basic Functions

| Function | Description |
| --- | --- |
| Low settings swap | Temporarily replaces `GameUserSettings.ini` with a low settings profile for seeding. |
| Automatic backup | Saves a backup of your current settings before every launch. |
| Automatic restore | Restores your original settings after Squad closes. |
| Windows power mode | Switches to Power saver while Squad is running, then restores your previous power plan. |
| Steam launch | Opens Squad using Steam game ID `393380`. |
| One-time install | Setup copies the launcher to your user profile and creates shortcuts. |

## Where Backups Are Stored

Backups are saved here:

```text
%LOCALAPPDATA%\SquadSeedingLauncher\Backups
```

The most recent backup is also stored as:

```text
%LOCALAPPDATA%\SquadSeedingLauncher\GameUserSettings_BeforeSeeding.ini
```

## Requirements

- Windows 10 or Windows 11
- Steam installed
- Squad installed through Steam
- Squad must have been launched at least once so its settings folder exists

## Build From Source

Run this from the project folder:

```powershell
powershell -ExecutionPolicy Bypass -File .\Build.ps1
```

The setup file will be created here:

```text
dist\SquadSeedingSetup.exe
```

The build uses the Windows .NET Framework compiler already included with Windows, so it does not require NuGet packages.

## Notes

- Keep the launcher window open while Squad is running. It uses that window to know when to restore your settings.
- If Squad does not start within 10 minutes, the launcher stops waiting and restores what it changed.
- If Windows blocks the file because it was downloaded from the internet, choose **More info** and then **Run anyway** if you trust the download source.

## Forward Operating Idiots

This tool was made for the **Forward Operating Idiots** Squad community to make seeding less painful on PC performance.

Join or learn more here:

- [forwardoperatingidiots.com](https://forwardoperatingidiots.com)
- [discord.forwardoperatingidiots.com](https://discord.forwardoperatingidiots.com)
