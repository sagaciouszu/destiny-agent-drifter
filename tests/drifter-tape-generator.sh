#!/bin/bash
# Drifter "How to Drift" Audio Tape Generator
# Generates an EDZ-style hidden survival tape backed by canonical lore.
# Usage: ./drifter-tape-generator.sh [ghosts|hope|starvation|aunor|shin|extinction]

TOPIC="${1:-ghosts}"
LOWER=$(echo "$TOPIC" | tr '[:upper:]' '[:lower:]')
SCORER="${ARCHIVE:-$(cd "$(dirname "$0")" && pwd)}/voice-scorer.py"

case "$LOWER" in
    *ghost*)
        PART="Part Three: Never Trust Your Ghost"
        BODY="Hey, kid. It's me. The Drifter. And this is 'How to Drift,' $PART. Your Ghost ain't your buddy, hero. He's a tool. A link to the Light, nothin' more. He brings you back 'cause he needs you alive. Don't trust him too far. Heh. That's all I got. Cut the tape."
        ;;
    *hope*|*eaton*)
        PART="Part One: Hope Gets You Killed"
        BODY="Hey, kid. It's me. The Drifter. And this is 'How to Drift,' $PART. Hope gets you killed, kid. I learned that in the Dark Age. You hope, and the world takes it. Better to play the hand you're dealt. No expectations. Heh. That's all I got. Cut the tape."
        ;;
    *starv*|*food*|*eat*|*hungry*)
        PART="Part Two: Guy's Gotta Eat"
        BODY="Hey, kid. It's me. The Drifter. And this is 'How to Drift,' $PART. You ever go hungry 'til you keeled over? We did that a lot. Our Ghosts brought us back - still hungry. Really pissed me off. Out on the frontier, you ask: think you can eat a Hive Knight? Heh. That's all I got. Cut the tape."
        ;;
    *aunor*|*praxic*|*vanguard*)
        PART="Part Four: Watch the Hardliners"
        BODY="Hey, kid. It's me. The Drifter. And this is 'How to Drift,' $PART. I thought the City made you all soft. But there's a hardliner - a Warlock named Aunor. Pretty sure she's tryin' to kill me. She crashed a handoff in Midtown. Took out a block. I woulda' talked 'em down. Watch your back, partner. Heh. That's all I got. Cut the tape."
        ;;
    *shin*|*malphur*|*golden*)
        PART="Part Five: The Man with the Golden Gun"
        BODY="Hey, kid. It's me. The Drifter. And this is 'How to Drift,' $PART. Truth is, you don't outdraw that Gunslinger. No one can. He follows the Light like a zealot. But my crew - armed with Malfeasance? We don't have to outdraw him. We just get our shots in. He dies too. You're part of my crew now. Heh. That's all I got. Cut the tape."
        ;;
    *)
        PART="Part Six: Seats I'm Savin'"
        BODY="Hey, kid. It's me. The Drifter. And this is 'How to Drift,' $PART. The Collapse wasn't the last extinction-level event. Ol' Drifter's seen another one comin'. Take every day as it is. Trade your jumpship for a long-range hauler. There's a few seats I'm savin'. One's for you. If you want it. Heh. That's all I got. Cut the tape."
        ;;
esac

echo "=== [AUDIO LOG: $PART] ==="
echo ""
echo "$BODY"
echo ""
python3 "$SCORER" "$BODY" | grep -E "Total Score:"