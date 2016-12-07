#!/bin/bash

# exit if a command fails
set -e

# Required parameters
if [ -z "${plist_path}" ] ; then
  echo " [!] Missing required input: plist_path"
  exit 1
fi
if [ ! -f "${plist_path}" ] ; then
  echo " [!] File doesn't exist at specified path: ${plist_path}"
  exit 1
fi

# Should Bundle Identifier be modified?
if [ -n "${bundle_identifier}" ] ; then
  ORIGINAL_BUNDLE_IDENTIFIER="$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "${plist_path}")"
  /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier ${bundle_identifier}" "${plist_path}"
  echo " (i) Bundle Identifier changed from $ORIGINAL_BUNDLE_IDENTIFIER to ${bundle_identifier}"
fi

# Should Bundle Identifier be modified?
if [ -n "${bundle_display_name}" ] ; then
  ORIGINAL_BUNDLE_NAME="$(/usr/libexec/PlistBuddy -c "Print :CFBundleDisplayName" "${plist_path}")"
  /usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName ${bundle_display_name}" "${plist_path}"
  echo " (i) Bundle Display Name changed from $ORIGINAL_BUNDLE_NAME to ${bundle_display_name}"
fi
