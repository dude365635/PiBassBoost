#!/usr/bin/env bash

# Portions of this script are derived from:
#   Original Project: EasyEffects-Presets (https://github.com/JackHack96/EasyEffects-Presets/)
#   Copyright (c) 2018 Matteo Iervasi
#   Licensed under the MIT License

set -euo pipefail

GIT_REPOSITORY="https://raw.githubusercontent.com/JackHack96/EasyEffects-Presets/master"

check_installation() {
    if command -v flatpak &>/dev/null && flatpak list | grep -q "com.github.wwmm.easyeffects"; then
        PRESETS_DIRECTORY="$HOME/.var/app/com.github.wwmm.easyeffects/config/easyeffects"
    elif command -v easyeffects &>/dev/null; then
        PRESETS_DIRECTORY="$HOME/.config/easyeffects"
    else
        echo "Error! Couldn't find EasyEffects installation!"
        exit 1
    fi

    mkdir -p "$PRESETS_DIRECTORY"
}

check_impulse_response_directory() {
    mkdir -p "$PRESETS_DIRECTORY/irs"
    mkdir -p "$PRESETS_DIRECTORY/output"
}

check_installation
check_impulse_response_directory

echo "Installing impulse response files..."

curl --fail --location --silent \
"$GIT_REPOSITORY/irs/Dolby%20ATMOS%20((128K%20MP3))%201.Default.irs" \
--output "$PRESETS_DIRECTORY/irs/Dolby ATMOS ((128K MP3)) 1.Default.irs"

curl --fail --location --silent \
"$GIT_REPOSITORY/irs/MaxxAudio%20Pro%20((128K%20MP3))%204.Music%20w%20MaxxSpace.irs" \
--output "$PRESETS_DIRECTORY/irs/MaxxAudio Pro ((128K MP3)) 4.Music w MaxxSpace.irs"

curl --fail --location --silent \
"$GIT_REPOSITORY/irs/MaxxAudio%20Pro%20((128K%20MP3))%204.Music%20w%20MaxxSpace%20Low%20Latency.irs" \
--output "$PRESETS_DIRECTORY/irs/MaxxAudio Pro ((128K MP3)) 4.Music w MaxxSpace Low Latency.irs"

curl --fail --location --silent \
"$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%201.Stereo%20+0%20Bass%20Low%20Latency.irs" \
--output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 1.Stereo +0 Bass Low Latency.irs"

curl --fail --location --silent \
"$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%202.Stereo%20+20%20bass.irs" \
--output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 2.Stereo +20 bass.irs"

curl --fail --location --silent \
"$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%203.Stereo%20+30%20Bass%20Low%20Latency.irs" \
--output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 3.Stereo +30 Bass Low Latency.irs"

curl --fail --location --silent \
"$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%207.Stereo%20+100%20Bass%20Low%20Latency.irs" \
--output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 7.Stereo +100 Bass Low Latency.irs"

curl --fail --location --silent \
"$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20Earpods%20HIFI.irs" \
--output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) Earpods HIFI.irs"

curl --fail --location --silent \
"$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20MDR-XB500%20HIFI.irs" \
--output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) MDR-XB500 HIFI.irs"

echo "Installing Bass Boosted Preset"

curl --fail --location --silent \
"$GIT_REPOSITORY/Bass%20Boosted.json" \
--output "$PRESETS_DIRECTORY/output/Bass Boosted.json"

sed -i "s|<PRESETS_DIRECTORY>|$PRESETS_DIRECTORY|g" \
"$PRESETS_DIRECTORY/output/Bass Boosted.json"

echo "Done installing presets"
