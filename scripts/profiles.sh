#!/bin/bash
# Portions of this script are derived from:
#   Original Project: EasyEffects-Presets (https://github.com/JackHack96/EasyEffects-Presets/)
#   Copyright (c) 2018 Matteo Iervasi
#   Licensed under the MIT License
#
# MIT License text:
# Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
#
# The overall combined work is licensed under GPLv3.

GIT_REPOSITORY="https://raw.githubusercontent.com/JackHack96/EasyEffects-Presets/master"

check_installation() {
    if command -v flatpak &>/dev/null && flatpak list | grep -q "com.github.wwmm.easyeffects"; then
        PRESETS_DIRECTORY="$HOME/.var/app/com.github.wwmm.easyeffects/config/easyeffects"
    elif which easyeffects >/dev/null; then
        PRESETS_DIRECTORY="$HOME/.config/easyeffects"
    else
        echo "Error! Couldn't find EasyEffects presets directory!"
        exit 1
    fi
    mkdir -p $PRESETS_DIRECTORY
}

check_impulse_response_directory() {
    if [ ! -d "$PRESETS_DIRECTORY/irs" ]; then
        mkdir "$PRESETS_DIRECTORY/irs"
    fi
    if [ ! -d "$PRESETS_DIRECTORY/output" ]; then
        mkdir "$PRESETS_DIRECTORY/output"
    fi
}

check_installation
check_impulse_response_directory

  echo "Installing impulse response files..."
        curl "$GIT_REPOSITORY/irs/Dolby%20ATMOS%20((128K%20MP3))%201.Default.irs" --output "$PRESETS_DIRECTORY/irs/Dolby ATMOS ((128K MP3)) 1.Default.irs" --silent
        curl "$GIT_REPOSITORY/irs/MaxxAudio%20Pro%20((128K%20MP3))%204.Music%20w%20MaxxSpace.irs" --output "$PRESETS_DIRECTORY/irs/MaxxAudio Pro ((128K MP3)) 4.Music w MaxxSpace.irs" --silent
        curl "$GIT_REPOSITORY/irs/MaxxAudio%20Pro%20((128K%20MP3))%204.Music%20w%20MaxxSpace%20Low%20Latency.irs" --output "$PRESETS_DIRECTORY/irs/MaxxAudio Pro ((128K MP3)) 4.Music w MaxxSpace Low Latency.irs" --silent
        curl "$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%201.Stereo%20+0%20Bass%20Low%20Latency.irs" --output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 1.Stereo +0 Bass Low Latency.irs" --silent
        curl "$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%202.Stereo%20+20%20bass.irs" --output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 2.Stereo +20 bass.irs" --silent
        curl "$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%202.Stereo%20+20%20bass%20Low%20Latency.irs" --output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 2.Stereo +20 bass Low Latency.irs" --silent
        curl "$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%203.Stereo%20+30%20Bass%20Low%20Latency.irs" --output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 3.Stereo +30 Bass Low Latency.irs" --silent
        curl "$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%204.Stereo%20+50%20Bass%20Low%20Latency.irs" --output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 4.Stereo +50 Bass Low Latency.irs" --silent
        curl "$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%205.Stereo%20+70%20Bass%20Low%20Latency.irs" --output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 5.Stereo +70 Bass Low Latency.irs" --silent
        curl "$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%206.Stereo%20+80%20Bass%20Low%20Latency.irs" --output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 6.Stereo +80 Bass Low Latency.irs" --silent
        curl "$GIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%207.Stereo%20+100%20Bass%20Low%20Latency.irs" --output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 7.Stereo +100 Bass Low Latency.irs" --silent
        curl "$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20Earpods%20HIFI.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) Earpods HIFI.irs" --silent
        curl "$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20MDR-E9LP%20HIFI.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) MDR-E9LP HIFI.irs" --silent
        curl "$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20MDR-E9LP%20SM%20SRH940.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) MDR-E9LP SM SRH940.irs" --silent
        curl "$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20MDR-E9LP%20SM%20XBA3.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) MDR-E9LP SM XBA3.irs" --silent
        curl "$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20MDR-E9LP%20SM%20beyerT1.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) MDR-E9LP SM beyerT1.irs" --silent
        curl "$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20MDR-XB500%20HIFI.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) MDR-XB500 HIFI.irs" --silent
        curl "$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20XBA-H3%20HIFI.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) XBA-H3 HIFI.irs" --silent
        curl "$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20XBA-H3%20SM%20SRH940.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) XBA-H3 SM SRH940.irs" --silent
        curl "$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20XBA-H3%20SM%20XBA4.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) XBA-H3 SM XBA4.irs" --silent
        curl "$GIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20XBA-H3%20SM%20beyerT1.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) XBA-H3 SM beyerT1.irs" --silent
        curl "$GIT_REPOSITORY/irs/Creative%20X-Fi%20((Z-Edition))%20Crystalizer%2010%20%2B%20Expand%2010.irs" --output "$PRESETS_DIRECTORY/irs/Creative X-Fi ((Z-Edition)) Crystalizer 10 + Expand 10.irs" --silent
        curl "$GIT_REPOSITORY/irs/HTC%20Beats%20Audio%20((Z-Edition)).irs" --output "$PRESETS_DIRECTORY/irs/HTC Beats Audio ((Z-Edition)).irs" --silent
        curl "$GIT_REPOSITORY/irs/Waves%20MaxxAudio%20((Z-Edition))%20AudioWizard%201.Music%20Low%20Latency.irs" --output "$PRESETS_DIRECTORY/irs/Waves MaxxAudio ((Z-Edition)) AudioWizard 1.Music Low Latency.irs" --silent
        curl "$GIT_REPOSITORY/irs/Waves%20MaxxAudio%20((Z-Edition))%20AudioWizard%201.Music.irs" --output "$PRESETS_DIRECTORY/irs/Waves MaxxAudio ((Z-Edition)) AudioWizard 1.Music.irs" --silent
        echo "Installing Bass Boosted Preset" #I (dude365635) added this to clarify what is happening
        curl "$GIT_REPOSITORY/Bass%20Boosted.json" --output "$PRESETS_DIRECTORY/output/Bass Boosted.json" --silent
        sed -i "s|<PRESETS_DIRECTORY>|$PRESETS_DIRECTORY|g" "$PRESETS_DIRECTORY/output/Bass Boosted.json"
