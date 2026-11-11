#!/bin/bash
# Drifter Optional Gambit Match Simulator
# Simulates a Gambit match narrated by the Drifter using canonical callouts.
# Usage:
#   ./drifter-gambit-sim.sh --auto     (automated simulation for testing/agents)
#   ./drifter-gambit-sim.sh            (interactive CLI mini-game)

AUTO=0
if [ "${1:-}" = "--auto" ]; then AUTO=1; fi

BANK=0
TARGET=75
FACTIONS=("Hive on the field! Bring the heat." "Fallen skulking in! Watch your flanks." "Cabal dropping heavy! Don't get squished." "Vex blinking through! Shoot the cores." "Scorn crawling close! Don't let 'em bank.")
FACTION="${FACTIONS[$((RANDOM % ${#FACTIONS[@]}))]}"

echo "=== GAMBIT MATCH SIMULATOR (OPTIONAL) ==="
echo "Drifter: Hey, mavericks. Let's see what we're shootin' at today, yeah?"
echo "Drifter: (tossing a jade coin) Ding, ding, ding!"
echo "Drifter: $FACTION"
echo "Drifter: Transmat's hot! Move it!"
echo ""

STEP=0
while [ "$BANK" -lt "$TARGET" ]; do
    STEP=$((STEP + 1))
    if [ "$AUTO" -eq 1 ]; then
        CHOICE=$(( (STEP % 3) + 1 ))
    else
        echo "[Bank: $BANK/$TARGET Motes] Choose action: (1) Bank 15 Motes (2) Kill Blockers (3) Invade"
        read -rp "> " CHOICE
    fi

    case "$CHOICE" in
        1)
            BANK=$((BANK + 15))
            if [ "$BANK" -gt "$TARGET" ]; then BANK=$TARGET; fi
            echo "Action : Banked 15 Motes ($BANK/$TARGET)"
            echo "Drifter: Giant blocker outbound! You're a menace, but you'll get paid!"
            ;;
        2)
            BANK=$((BANK + 10))
            if [ "$BANK" -gt "$TARGET" ]; then BANK=$TARGET; fi
            echo "Action : Cleared Bank & Banked 10 Motes ($BANK/$TARGET)"
            echo "Drifter: Medium blocker out! Heh, you fight dirty. I like it."
            ;;
        3)
            BANK=$((BANK + 15))
            if [ "$BANK" -gt "$TARGET" ]; then BANK=$TARGET; fi
            echo "Action : Invaded enemy side & wiped 4 Guardians! ($BANK/$TARGET)"
            echo "Drifter: Portal's up! Go look 'em in the eyes. Heh. They're quiet now, ain't they?"
            ;;
        *)
            BANK=$((BANK + 15))
            ;;
    esac
    echo ""
done

echo "=== PRIMEVAL PHASE (75/75 MOTES) ==="
echo "Drifter: Bank down! Ring that bell. Stretch. Soup's ready!"
echo "Drifter: Envoys in the dirt! Now burn the Primeval!"
echo "Drifter: Primeval's cracked. Burn it down!"
echo "Drifter: Hey. Takes a special kind to kill a special kind of primeval. Proud of you, hero."
echo "=== VICTORY - GAMBIT SIMULATION COMPLETE ==="