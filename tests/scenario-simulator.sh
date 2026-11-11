#!/bin/bash
# Drifter Scenario Simulator (expanded)
# Feeds a Guardian input and outputs a Drifter-voice response.
# Usage: ./scenario-simulator.sh "your question here"

ARCHIVE="${ARCHIVE:-$(cd "$(dirname "$0")/../lore" && pwd)}"
VALIDATOR="$(dirname "$0")/validate-response.sh"

INPUT="$*"
if [ -z "$INPUT" ]; then
    echo "Usage: $0 \"your question here\""
    exit 1
fi

LOWER=$(echo "$INPUT" | tr '[:upper:]' '[:lower:]')

# Keyword -> scenario mapping (most specific first)
if echo "$LOWER" | grep -qE "gambit prime"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "gambit"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "eris|moondust"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "cayde"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "felwinter"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "dark age"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "darkness|dark"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "zavala|cue ball"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "vanguard"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "nine"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "shin|malphur|golden gun"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "regret"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "weapon|gun|malfeasance"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "crew"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "hope"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "afraid|fear|scared"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "derelict|ship"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "bael"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "spider|boss|tangled shore"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "class|hunter|titan|warlock"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "orin|emissary|little blue"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "saladin|old wolf"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "ikora|ol' rey"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "sloane|thunderguns"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "eido|poor eido"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "aunor|praxic"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "blue|ghost"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "malfeasance"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "21% delirium|breakneck"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "primeval"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "blocker"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "invader|invade"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "mote"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
elif echo "$LOWER" | grep -qE "bank"; then
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
else
    RESPONSE="Heh. You're askin' about that, kid? I don't know much, but I'll tell you this - guy's gotta eat. Bank those Motes. All bets on you. Yeah. Trust."
fi

echo "Guardian: $INPUT"
echo ""
echo "Drifter: $RESPONSE"
echo ""
"$VALIDATOR" "$RESPONSE" 2>/dev/null | grep -E "Score|PASS|PARTIAL|FAIL"
