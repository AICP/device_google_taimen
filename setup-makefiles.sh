#!/bin/bash
#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

VENDOR=google
DEVICE=taimen

# Load extractutils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

AICP_ROOT="$MY_DIR"/../../..

HELPER="$AICP_ROOT"/vendor/aicp/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Write custom header
function write_taimen_headers() {
    write_header "$ANDROIDMK"

    cat << EOF >> "$ANDROIDMK"
LOCAL_PATH := \$(call my-dir)

EOF
    cat << EOF >> "$ANDROIDMK"
ifeq (\$(TARGET_DEVICE),taimen)

EOF

    write_header "$BOARDMK"
    write_header "$PRODUCTMK"
}

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$AICP_ROOT"

# Copyright headers and guards
write_taimen_headers

# The standard blobs
write_makefiles "$MY_DIR"/lineage-proprietary-files.txt

# Done
write_footers