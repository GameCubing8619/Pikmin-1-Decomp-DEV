#! /usr/bin/env python3

# Written by Ethan Roseman (ethteck)
# MIT License
# Copyright 2021

import argparse

# Byte sequences that mark end of code
EOC_BYTES = [b"\x4E\x80\x00\x20\x02", b"\x48\x00\x00\x01\x02"]

# Example invocation: ./frank.py vanilla.o profile.o output.o
parser = argparse.ArgumentParser()
parser.add_argument("vanilla", help="Path to the vanilla object", type=argparse.FileType('rb'))
parser.add_argument("profile", help="Path to the profile object", type=argparse.FileType('rb'))
parser.add_argument("target", help="Path to the target object (to write)")

args = parser.parse_args()

# Read contents into bytearrays and close files
vanilla_bytes = args.vanilla.read()
args.vanilla.close()
profile_bytes = args.profile.read()
args.profile.close()

# Remove byte sequence
stripped_bytes = profile_bytes.replace(b"\x48\x00\x00\x01\x60\x00\x00\x00", b"")

# Find end of code sections in vanilla and stripped bytes
vanilla_eoc = len(vanilla_bytes)
stripped_eoc = len(stripped_bytes)
for seq in EOC_BYTES:
    vanilla_idx = vanilla_bytes.find(seq)
    if -1 < vanilla_idx < vanilla_eoc:
        vanilla_eoc = vanilla_idx

    stripped_idx = stripped_bytes.find(seq)
    if -1 < stripped_idx < stripped_eoc:
        stripped_eoc = stripped_idx

# Break if the detected vanilla end-of-code is not the same from the stripped profile end-of-code
assert(vanilla_eoc == stripped_eoc)
# or if the eoc is not found
assert(vanilla_eoc != len(vanilla_bytes))

# Replace 0x34 - eoc in vanilla with bytes from stripped
final_bytes = vanilla_bytes[:0x34] + stripped_bytes[0x34:stripped_eoc] + vanilla_bytes[stripped_eoc:]

with open(args.target, "wb") as f:
    f.write(final_bytes)
