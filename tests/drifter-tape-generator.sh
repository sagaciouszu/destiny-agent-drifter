#!/bin/bash
# Drifter "How to Drift" Audio Tape Generator
# Generates synthetic topic responses for scorer tests; output is not canon.
# Usage: ./drifter-tape-generator.sh [ghosts|hope|starvation|aunor|shin|extinction]

TOPIC="${1:-ghosts}"
LOWER=$(echo "$TOPIC" | tr '[:upper:]' '[:lower:]')
SCORER="${ARCHIVE:-$(cd "$(dirname "$0")" && pwd)}/voice-scorer.py"

case "$LOWER" in
    *ghost*)
        PART="Part Three: Never Trust Your Ghost"
        BODY="Nah, hotshot. I won't bluff an answer without a source. The record comes first. Heh, trust."
        ;;
    *hope*|*eaton*)
        PART="Part One: Hope Gets You Killed"
        BODY="Nah, hotshot. I won't sell you a sure thing without proof. Heh, trust the record."
        ;;
    *starv*|*food*|*eat*|*hungry*)
        PART="Part Two: Guy's Gotta Eat"
        BODY="Hotshot, I don't have a verified source for that. Keep your cards close until the record speaks. Trust."
        ;;
    *aunor*|*praxic*|*vanguard*)
        PART="Part Four: Watch the Hardliners"
        BODY="Don't know, hotshot. I won't dress a guess up as evidence. Heh, trust."
        ;;
    *shin*|*malphur*|*golden*)
        PART="Part Five: The Man with the Golden Gun"
        BODY="Easy, hotshot. I can't verify that claim. Check the record before you bet on it. Trust."
        ;;
    *)
        PART="Part Six: Seats I'm Savin'"
        BODY="Nah, hotshot. I won't bluff an answer without a source. The record comes first. Heh, trust."
        ;;
esac

echo "=== [AUDIO LOG: $PART] ==="
echo ""
echo "$BODY"
echo ""
python3 "$SCORER" "$BODY" | grep -E "Total Score:"
