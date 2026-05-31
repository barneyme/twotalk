#!/bin/bash

################################################################################
# TT - Two Talk Editor
################################################################################

RED='\033[38;5;214m'
GREEN='\033[1;33m'
YELLOW='\033[38;5;226m'
BLUE='\033[38;5;214m'
CYAN='\033[1;33m'
NC='\033[0m'

CONFIG_DIR="$HOME/.tt"
LAST_FILE_PATH="$CONFIG_DIR/lastfile"
mkdir -p "$CONFIG_DIR" 2>/dev/null

CURRENT_FILE=""
FILE_MODIFIED=false
CONTENT=""
QUICK_EDIT_MODE=false

# --- Complete Two Talk Vocabulary Data Array ---
declare -a TT_DICTIONARY

# 81 Core Primes
TT_DICTIONARY+=(
    "@@|self|PERSON" "@#|person|PERSON" "@!|I / me|PERSON" "@?|you|PERSON" "@>|someone|PERSON" "@<|young|PERSON" "@:|old|PERSON" "@^|other|PERSON" "@%|group|PERSON"
    "#@|body|THING" "##|thing|THING" "#!|tool|THING" "#?|word|THING" "##>|output|THING" "#<|input|THING" "#:|material|THING" "#^|this|THING" "#%|part|THING"
    "!@|help|VALUE" "!#|purpose|VALUE" "!!|good|VALUE" "!?|need|VALUE" "!>|big|VALUE" "!<|small|VALUE" "!:|bad|VALUE" "!^|true|VALUE" "!%|all|VALUE"
    "?@|feeling|MIND" "?#|sense|MIND" "?!|know|MIND" "??|fact|MIND" "?>|listen|MIND" "?<|think|MIND" "?:|way|MIND" "?^|focus|MIND" "?%|desire|MIND"
    ">@|speech|ACT" ">#|move|ACT" ">!|action|ACT" ">?|ask|ACT" ">>|is|ACT" "><|transfer|ACT" ">:|contact|ACT" ">^|stay|ACT" ">%|act|ACT"
    "<@|hold|STRUCTURE" "<#|type|STRUCTURE" "<!|not|STRUCTURE" "<?|because|STRUCTURE" "<>|same|STRUCTURE" "<<|have|STRUCTURE" "<:|if|STRUCTURE" "<^|with|STRUCTURE" "<%|can|STRUCTURE"
    ":@|life|CHRONIC" ":#|now|CHRONIC" ":!|moment|CHRONIC" ":?|brief|CHRONIC" ":>|future|CHRONIC" ":<|past|CHRONIC" "::|time|CHRONIC" ":^|soon|CHRONIC" ":%|always|CHRONIC"
    "^@|here|SPACE" "^#|side|SPACE" "^!|above|SPACE" "^?|inside|SPACE" "^>|below|SPACE" "^<|far|SPACE" "^:|near|SPACE" "^^|space|SPACE" "^%|distance|SPACE"
    "%@|more|SCALE" "%#|less|SCALE" "%!|very|SCALE" "%?|maybe|SCALE" "%>|many|SCALE" "%<|some|SCALE" "%:|most|SCALE" "%^|few|SCALE" "%%|size|SCALE"
)

# Compounds & Stacked Terms (A-D)
TT_DICTIONARY+=(
    "<%|able|COMPOUND" "?:|about|COMPOUND" "^!|above|COMPOUND" "^%|across|COMPOUND" ">%|act|COMPOUND" "%@.>!|add|COMPOUND" ":>|after|COMPOUND" "%@.::|again|COMPOUND"
    "<!|against|COMPOUND" "::|age|COMPOUND" ":<|ago|COMPOUND" "##|air|COMPOUND" "!%|all|COMPOUND" "%<.<!|almost|COMPOUND" "@@|alone|COMPOUND" "<^|along|COMPOUND"
    ":<|already|COMPOUND" "<>|also|COMPOUND" "<:|although|COMPOUND" "%:|always|COMPOUND" ">>|am|COMPOUND" "^?|among|COMPOUND" ":@.##|animal|COMPOUND" ">@.<?|answer|COMPOUND"
    "?#|appear|COMPOUND" "^^|area|COMPOUND" "^^|around|COMPOUND" ">?|ask|COMPOUND" "^@|at|COMPOUND" "^<|away|COMPOUND" "^#|back|COMPOUND" ">>|be|COMPOUND"
    ">>.:<|became|COMPOUND" "<?|because|COMPOUND" ">>.:>|become|COMPOUND" ">>.:<|been|COMPOUND" ":<|before|COMPOUND" ">!.:<|began|COMPOUND" "^#|behind|COMPOUND"
    ":@|being|COMPOUND" "?<.<!|believe|COMPOUND" "^>|below|COMPOUND" "!!.%!|best|COMPOUND" "!!.%@|better|COMPOUND" "^#|between|COMPOUND" "!>|big|COMPOUND"
    ":@.##|bird|COMPOUND" "##.#?|book|COMPOUND" "%:|both|COMPOUND" "><.:<|brought|COMPOUND" ">!.##|build|COMPOUND" ">!.##.:<|built|COMPOUND" "#!|bus|COMPOUND"
    ">!|business|COMPOUND" "<!|but|COMPOUND" "><|buy|COMPOUND" "^:|by|COMPOUND" ">@|call|COMPOUND" ">>.:<|came|COMPOUND" "<%|can|COMPOUND" "<!.<%|cannot|COMPOUND"
    "#!|car|COMPOUND" "?@|care|COMPOUND" "<@|carry|COMPOUND" "##|case|COMPOUND" ":@.##|cat|COMPOUND" "<?|cause|COMPOUND" "^?|center|COMPOUND" "!^|certain|COMPOUND"
    ">#|change|COMPOUND" "?<|check|COMPOUND" "@<|child|COMPOUND" "@%.@<|children|COMPOUND" "^^.%@|city|COMPOUND" "<#|class|COMPOUND" "^:|close|COMPOUND"
    "!:.?:|cold|COMPOUND" ">#|come|COMPOUND" "<>|common|COMPOUND" "@%|company|COMPOUND" "!%|complete|COMPOUND" "<%.:<|could|COMPOUND" "^^|country|COMPOUND"
    "?:|course|COMPOUND" ">!|cut|COMPOUND" "##|dark|COMPOUND" "::|day|COMPOUND" "!?|decide|COMPOUND" "!?|decision|COMPOUND" "^>|deep|COMPOUND"
    ">!.:<|did|COMPOUND" "@^|differ|COMPOUND" "@^|different|COMPOUND" ">!|do|COMPOUND" ">!|does|COMPOUND" ":@.##|dog|COMPOUND" ">!.:<|done|COMPOUND"
    "<!.>!|don't|COMPOUND" "#<|door|COMPOUND" "^>|down|COMPOUND" ">!|draw|COMPOUND" ">#|drive|COMPOUND" "##|dry|COMPOUND" "::|during|COMPOUND"
)

# Compounds & Stacked Terms (E-M)
TT_DICTIONARY+=(
    "!%|each|COMPOUND" ":^|early|COMPOUND" "##|earth|COMPOUND" "^#|east|COMPOUND" "!!.<%|easy|COMPOUND" ">!|eat|COMPOUND" ":<|end|COMPOUND"
    "!%|enough|COMPOUND" "<>|even|COMPOUND" "%:|ever|COMPOUND" "!%|every|COMPOUND" "##.!%|everything|COMPOUND" "<#|example|COMPOUND" "#@|face|COMPOUND"
    "??|fact|COMPOUND" "^>|fall|COMPOUND" "@%|family|COMPOUND" "^<|far|COMPOUND" "%!.:|fast|COMPOUND" "@#|father|COMPOUND" "?@|feel|COMPOUND"
    "#@|feet|COMPOUND" "%^|few|COMPOUND" "^^|field|COMPOUND" "##|figure|COMPOUND" "%@|fill|COMPOUND" "?#|find|COMPOUND" "!!|fine|COMPOUND"
    "#@|finger|COMPOUND" "##|fire|COMPOUND" "1|first|COMPOUND" ":@.##|fish|COMPOUND" "5|five|COMPOUND" "^>|floor|COMPOUND" ">#|fly|COMPOUND"
    ":>|follow|COMPOUND" "##|food|COMPOUND" "#@|foot|COMPOUND" "!#|for|COMPOUND" ">!|force|COMPOUND" "<#|form|COMPOUND" "?#.:<|found|COMPOUND"
    "4|four|COMPOUND" "<%|free|COMPOUND" "@#|friend|COMPOUND" ":<|from|COMPOUND" "^>|front|COMPOUND" "!%|full|COMPOUND" "!!|funny|COMPOUND"
    ">%|game|COMPOUND" "^^|garden|COMPOUND" "><.:<|gave|COMPOUND" "!%|general|COMPOUND" "<<|get|COMPOUND" "@<|girl|COMPOUND" "><|give|COMPOUND"
    "><.:<|given|COMPOUND" ">#|go|COMPOUND" "#:|gold|COMPOUND" ">>.:<|gone|COMPOUND" "!!|good|COMPOUND" "<<.:<|got|COMPOUND" "@%|government|COMPOUND"
    "!>.%!|great|COMPOUND" "##|green|COMPOUND" "##|ground|COMPOUND" "%@|grow|COMPOUND" "<<.:<|had|COMPOUND" "#%|half|COMPOUND" "#@|hand|COMPOUND"
    ">!|happen|COMPOUND" "!:|hard|COMPOUND" "<<|has|COMPOUND" "<<|have|COMPOUND" "@#|he|COMPOUND" "#@|head|COMPOUND" "?>|hear|COMPOUND"
    "?>.:<|heard|COMPOUND" "##|heat|COMPOUND" "%!|heavy|COMPOUND" "!@|help|VALUE" "@#|her|COMPOUND" "^@|here|COMPOUND" "^!|high|COMPOUND"
    "@#|him|COMPOUND" "@@|himself|COMPOUND" "@#|his|COMPOUND" ":<|history|COMPOUND" "<@|hold|COMPOUND" "^^|home|COMPOUND" "?%|hope|COMPOUND"
    ":@.##|horse|COMPOUND" "##|hot|COMPOUND" "::|hour|COMPOUND" "##|house|COMPOUND" "?:|how|COMPOUND" "<!|however|COMPOUND" "100|hundred|COMPOUND"
    "@!|i|COMPOUND" "?<|idea|COMPOUND" "<:|if|COMPOUND" "!!|important|COMPOUND" "^?|in|COMPOUND" "<@|include|COMPOUND" "^?|into|COMPOUND"
    ">>|is|ACT" "##|it|COMPOUND" "##|its|COMPOUND" "@@|itself|COMPOUND" ">!|job|COMPOUND" "!^|just|COMPOUND"
    "<@|keep|COMPOUND" "<#|kind|COMPOUND" "?!.:<|knew|COMPOUND" "?!|know|COMPOUND" "##|land|COMPOUND" "#?|language|COMPOUND"
    "!>|large|COMPOUND" ":<|last|COMPOUND" ":<|late|COMPOUND" ":>|later|COMPOUND" ">@|laugh|COMPOUND" ">^|lay|COMPOUND"
    ">!|lead|COMPOUND" "?!|learn|COMPOUND" "%#|least|COMPOUND" ">|leave|COMPOUND" "^#|left|COMPOUND" "%#|less|COMPOUND"
    "<%|let|COMPOUND" "#?|letter|COMPOUND" ":@|life|COMPOUND" "##|light|COMPOUND" "<>|like|COMPOUND" "#?|line|COMPOUND"
    "##|list|COMPOUND" "?>|listen|COMPOUND" "!<|little|COMPOUND" ":@|live|COMPOUND" "::|long|COMPOUND" "?#|look|COMPOUND"
    "<!|lost|COMPOUND" "%>|lot|COMPOUND" "?@|love|COMPOUND" "^>|low|COMPOUND" "#!|machine|COMPOUND" ">!.##.:<|made|COMPOUND"
    ">!.##|make|COMPOUND" "@#|man|COMPOUND" "%>|many|COMPOUND" "##|map|COMPOUND" "#?|mark|COMPOUND" "<%|may|COMPOUND"
    "%?|maybe|COMPOUND" ">@|mean|COMPOUND" "%%|measure|COMPOUND" ">:|meet|COMPOUND" "@%|men|COMPOUND" "<%|might|COMPOUND"
    "^%|mile|COMPOUND" "1000000|million|COMPOUND" "?|mind|COMPOUND" ":!|minute|COMPOUND" "<!|miss|COMPOUND" "#:|money|COMPOUND"
    "::|month|COMPOUND" "%@|more|SCALE" ":^|morning|COMPOUND" "%!|most|COMPOUND" "@#|mother|COMPOUND" "^^|mountain|COMPOUND"
)

# Compounds & Stacked Terms (N-Z)
TT_DICTIONARY+=(
    ">#|move|COMPOUND" "^^|national|COMPOUND" "^:|near|COMPOUND" "!?|need|COMPOUND" "<!.%:|never|COMPOUND" ":^|new|COMPOUND" ":>|next|COMPOUND"
    ":<|night|COMPOUND" "<!|no|COMPOUND" "^#|north|COMPOUND" "<!|not|COMPOUND" "##.<!|nothing|COMPOUND" "?#|notice|COMPOUND"
    ":#|now|COMPOUND" "%|number|COMPOUND" "<!|off|COMPOUND" "^^|office|COMPOUND" "%>|often|COMPOUND" "@:|old|COMPOUND"
    "^!|on|COMPOUND" "1|once|COMPOUND" "1|one|COMPOUND" "1|only|COMPOUND" "<>|open|COMPOUND" "%?|or|COMPOUND"
    "?:|order|COMPOUND" "@^|other|COMPOUND" "@%|others|COMPOUND" "@%|our|COMPOUND" "#>|out|COMPOUND" "#>|outside|COMPOUND"
    "^!|over|COMPOUND" "<<|own|COMPOUND" "##|page|COMPOUND" "##|paper|COMPOUND" "#%|part|COMPOUND" "@%|party|COMPOUND"
    ">#|pass|COMPOUND" ":<|past|COMPOUND" "><|pay|COMPOUND" "@|people|COMPOUND" "@#|person|COMPOUND" "##|picture|COMPOUND"
    "^^|place|COMPOUND" "##|plant|COMPOUND" ">%|play|COMPOUND" "^@|point|COMPOUND" "^^|position|COMPOUND" "<%|possible|COMPOUND"
    "!|power|COMPOUND" "%?|probably|COMPOUND" "!:|problem|COMPOUND" ">#|put|COMPOUND" ">?|question|COMPOUND"
    ":?|quick|COMPOUND" ":?|quickly|COMPOUND" "%!|quite|COMPOUND" "##|rain|COMPOUND" "?>|read|COMPOUND"
    "<%|ready|COMPOUND" "!^|real|COMPOUND" "%!|really|COMPOUND" "<?|reason|COMPOUND" "#<|receive|COMPOUND"
    "?!|remember|COMPOUND" "!!|right|COMPOUND" "##|river|COMPOUND" "^^|road|COMPOUND" "^^|room|COMPOUND"
    "%%|round|COMPOUND" ">|run|COMPOUND" ">@.:<|said|COMPOUND" "<>|same|COMPOUND" "?#.:<|saw|COMPOUND"
    ">@|say|COMPOUND" "^^|school|COMPOUND" "##|sea|COMPOUND" "2|second|COMPOUND" "?#|see|COMPOUND"
    ">|seem|COMPOUND" "?#.:<|seen|COMPOUND" "@@|self|COMPOUND" "#?|sentence|COMPOUND" ">#|set|COMPOUND"
    "%<|several|COMPOUND" ":>|shall|COMPOUND" "@#|she|COMPOUND" "!?|should|COMPOUND" "?>|show|COMPOUND"
    "^#|side|COMPOUND" "<?|since|COMPOUND" "!<|small|COMPOUND" "%!|so|COMPOUND" "%<|some|COMPOUND"
    "@>|someone|COMPOUND" "##|something|COMPOUND" "%<|sometimes|COMPOUND" "@<|son|COMPOUND" "#?|song|COMPOUND"
    ":^|soon|COMPOUND" "?#|sound|COMPOUND" "#?|spell|COMPOUND" ">|stand|COMPOUND" ">!|start|COMPOUND"
    ">|state|COMPOUND" ">|stay|COMPOUND" ">#|step|COMPOUND" ">|still|COMPOUND" "<!.>#|stop|COMPOUND"
    "#?|story|COMPOUND" "^^|street|COMPOUND" "?!|study|COMPOUND" "<>|such|COMPOUND" "##|sun|COMPOUND"
    "!^|sure|COMPOUND" "<@|take|COMPOUND" ">@|talk|COMPOUND" ">@|tell|COMPOUND" "<|than|COMPOUND"
    "#^|that|COMPOUND" "@%|their|COMPOUND" "@%|them|COMPOUND" "@@|themselves|COMPOUND" ":>|then|COMPOUND"
    "^^|there|COMPOUND" "#^|these|COMPOUND" "@%|they|COMPOUND" "##|thing|COMPOUND" "?<|think|COMPOUND"
    "3|third|COMPOUND" "#^|this|COMPOUND" "#^|those|COMPOUND" "<!|though|COMPOUND" "?<|thought|COMPOUND"
    "1000|thousand|COMPOUND" "3|three|COMPOUND" "^?|through|COMPOUND" "::|time|COMPOUND" ":>|to|COMPOUND"
    "<^|together|COMPOUND" ">@.:<|told|COMPOUND" "%!|too|COMPOUND" "<@.:<|took|COMPOUND" "^^|town|COMPOUND"
    "##|tree|COMPOUND" ">#|turn|COMPOUND" "2|two|COMPOUND" "^>|under|COMPOUND" ":>|until|COMPOUND"
    "^!|up|COMPOUND" "^!|upon|COMPOUND" "@%|us|COMPOUND" "#!|use|COMPOUND" "%:|usually|COMPOUND"
    "%!|very|COMPOUND" "?#|watch|COMPOUND" "##|water|COMPOUND" "?:|way|COMPOUND"
    "@%|we|COMPOUND" "!!|well|COMPOUND" ">>.:<|went|COMPOUND" ">>.:<|were|COMPOUND" "#|what|COMPOUND"
    ":|when|COMPOUND" "^|where|COMPOUND" "%?|whether|COMPOUND" "#^|which|COMPOUND" "::|while|COMPOUND"
    "@|who|COMPOUND" "!%|whole|COMPOUND" ">?|why|COMPOUND" ":>|will|COMPOUND" "##|wind|COMPOUND"
    "<^|with|COMPOUND" "^?|within|COMPOUND" "<!.<^|without|COMPOUND" "#?|word|COMPOUND" ">!|work|COMPOUND"
    "^^|world|COMPOUND" "<%|would|COMPOUND" ">!|write|COMPOUND" ">!.:<|written|COMPOUND" "::|year|COMPOUND"
    "!^|yes|COMPOUND" "<!|yet|COMPOUND" "@?|you|COMPOUND" "@<|young|COMPOUND" "@?|your|COMPOUND"
)

show_header() {
    clear
    echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "             ${BLUE}TT - Two Talk Editor${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo
}

show_main_menu() {
    show_header
    if [ -n "$CURRENT_FILE" ]; then
        local status=""
        if [ "$FILE_MODIFIED" = true ]; then
            status="${YELLOW}(modified)${NC}"
        else
            status="${GREEN}(saved)${NC}"
        fi
        echo -e "Current file: ${BLUE}$CURRENT_FILE${NC} $status"
        echo
    fi
    echo -e "  ${CYAN}1)${NC} Create new file"
    echo -e "  ${CYAN}2)${NC} Open existing file"
    if [ -n "$CURRENT_FILE" ]; then
        echo -e "  ${CYAN}e)${NC} Edit current file"
        echo -e "  ${CYAN}s)${NC} Save current file"
        echo -e "  ${CYAN}c)${NC} Close current file"
    fi
    echo -e "  ${CYAN}t)${NC} Two Talk Dictionary Lookup"
    echo -e "  ${CYAN}3)${NC} Show Core Symbols Matrix"
    echo -e "  ${CYAN}4)${NC} Show Grammar Rules Reference"
    if [ -f "$LAST_FILE_PATH" ] && [ -z "$CURRENT_FILE" ]; then
        echo -e "  ${CYAN}r)${NC} Reopen last file (${BLUE}$(basename $(cat "$LAST_FILE_PATH"))${NC})"
    fi
    echo -e "  ${CYAN}6)${NC} Exit TT"
    echo
}

create_new_file() {
    read -p "Enter path/name for new file: " filename
    if [ -n "$filename" ]; then
        CURRENT_FILE="$filename"
        CONTENT=""
        FILE_MODIFIED=true
        echo "$CURRENT_FILE" > "$LAST_FILE_PATH"
        QUICK_EDIT_MODE=true
    fi
}

open_file() {
    read -p "Enter path to file: " filename
    if [ -f "$filename" ]; then
        CURRENT_FILE="$filename"
        CONTENT=$(<"$CURRENT_FILE")
        FILE_MODIFIED=false
        echo "$CURRENT_FILE" > "$LAST_FILE_PATH"
        QUICK_EDIT_MODE=true
    else
        echo -e "${RED}File not found!${NC}"
        sleep 1.5
    fi
}

save_file() {
    if [ -n "$CURRENT_FILE" ]; then
        echo "$CONTENT" > "$CURRENT_FILE"
        FILE_MODIFIED=false
        echo -e "${GREEN}File saved successfully!${NC}"
        sleep 1
    fi
}

close_file() {
    if [ "$FILE_MODIFIED" = true ]; then
        read -p "Save changes before closing? (y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then save_file; fi
    fi
    CURRENT_FILE=""
    CONTENT=""
    FILE_MODIFIED=false
}

edit_file() {
    while true; do
        show_header
        echo -e "Editing: ${BLUE}$CURRENT_FILE${NC}"
        echo -e "${CYAN}------------------------------------------------------------${NC}"
        if [ -z "$CONTENT" ]; then
            echo -e "${YELLOW}[Empty File]${NC}"
        else
            echo "$CONTENT" | awk '{print NR ": " $0}'
        fi
        echo -e "${CYAN}------------------------------------------------------------${NC}"
        echo -e "Options: ${CYAN}[a]${NC} Append line  ${CYAN}[d]${NC} Delete line  ${CYAN}[i]${NC} Insert line  ${CYAN}[q]${NC} Main Menu"
        read -p "Choice: " -n 1 -r action
        echo
        case $action in
            a|A)
                read -p "Enter text to append: " text
                if [ -z "$CONTENT" ]; then CONTENT="$text"; else CONTENT="$CONTENT$'
'$text"; fi
                FILE_MODIFIED=true ;;
            d|D)
                read -p "Enter line number to delete: " line_num
                if [[ "$line_num" =~ ^[0-9]+$ ]]; then
                    CONTENT=$(echo "$CONTENT" | sed "${line_num}d")
                    FILE_MODIFIED=true
                fi ;;
            i|I)
                read -p "Enter line number for insertion: " line_num
                read -p "Enter text to insert: " text
                if [[ "$line_num" =~ ^[0-9]+$ ]]; then
                    if [ "$line_num" -eq 1 ]; then
                        CONTENT="$text$'
'$CONTENT"
                    else
                        CONTENT=$(echo "$CONTENT" | sed "${line_num}i\\"$text )
                    fi
                    FILE_MODIFIED=true
                fi ;;
            q|Q) break ;;
        esac
    done
}

two_talk_lookup() {
    while true; do
        show_header
        echo -e "${GREEN}=== Two Talk Contextual Dictionary Search ===${NC}"
        read -p "Enter query literal (or 'q' to back out): " query
        if [ "$query" = "q" ] || [ "$query" = "Q" ]; then break; fi
        if [ -z "$query" ]; then continue; fi
        
        echo
        echo -e "${YELLOW}Matching Database Entries:${NC}"
        local count=0
        for entry in "${TT_DICTIONARY[@]}"; do
            if [[ "$entry" == *"$query"* ]]; then
                local symbol=$(echo "$entry" | cut -d'|' -f1)
                local English=$(echo "$entry" | cut -d'|' -f2)
                local type=$(echo "$entry" | cut -d'|' -f3)
                printf "  ${CYAN}%-10s${NC} -> ${BLUE}%-15s${NC} [%s]
" "$symbol" "$English" "$type"
                count=$((count+1))
            fi
        done
        if [ $count -eq 0 ]; then echo -e "  ${RED}No explicit translations discovered for: $query${NC}"; fi
        echo
        read -p "Press [Enter] to query again..."
    done
}

show_core_symbols() {
    show_header
    echo -e "${GREEN}=== Core Symbol Primes Matrix ===${NC}"
    echo "  @ : People / Focus     # : Objects / Material   ! : Value / Quality"
    echo "  ? : Mind / Mental      > : Outward Action       < : Relation / Inward"
    echo "  : : Time / Chronic     ^ : Space / Spatial      % : Scale / Evaluation"
    echo
    read -p "Press [Enter] to resume standard workspace..."
}

show_grammar_rules() {
    show_header
    echo -e "${GREEN}=== Structural Grammar Syntax Rules ===${NC}"
    echo "  1. Fundamental semantic combinations are bound in double character pairs (e.g. @#)"
    echo "  2. Complex relational chaining joins primitives dynamically via dots (e.g. @#.>!.!!)"
    echo "  3. Sentences stream layout horizontally from left to right structural alignments."
    echo
    read -p "Press [Enter] to resume standard workspace..."
}

if [ -n "$1" ]; then
    if [ -f "$1" ]; then
        CURRENT_FILE="$1"
        CONTENT=$(<"$CURRENT_FILE")
        FILE_MODIFIED=false
        echo "$CURRENT_FILE" > "$LAST_FILE_PATH"
        QUICK_EDIT_MODE=true
    else
        CURRENT_FILE="$1"
        CONTENT=""
        FILE_MODIFIED=true
        echo "$CURRENT_FILE" > "$LAST_FILE_PATH"
        QUICK_EDIT_MODE=true
    fi
fi

while true; do
    if [ "$QUICK_EDIT_MODE" = true ] && [ -n "$CURRENT_FILE" ]; then
        QUICK_EDIT_MODE=false
        edit_file
        continue
    fi
    show_main_menu
    read -p "Select option: " -n 1 -r
    echo
    case $REPLY in
        1) create_new_file ;;
        2) open_file ;;
        e) if [ -n "$CURRENT_FILE" ]; then edit_file; fi ;;
        s) if [ -n "$CURRENT_FILE" ]; then save_file; fi ;;
        c) if [ -n "$CURRENT_FILE" ]; then close_file; fi ;;
        t) two_talk_lookup ;;
        3) show_core_symbols ;;
        4) show_grammar_rules ;;
        r)
            if [ -f "$LAST_FILE_PATH" ]; then
                last_file=$(cat "$LAST_FILE_PATH")
                if [ -f "$last_file" ]; then
                    CURRENT_FILE="$last_file"
                    CONTENT=$(<"$CURRENT_FILE")
                    FILE_MODIFIED=false
                    QUICK_EDIT_MODE=true
                fi
            fi ;;
        6)
            if [ -n "$CURRENT_FILE" ] && [ "$FILE_MODIFIED" = true ]; then
                read -p "Save workspace changes before exiting? (y/n): " -n 1 -r
                echo
                if [[ $REPLY =~ ^[Yy]$ ]]; then save_file; fi
            fi
            clear
            echo -e "${GREEN}Thanks for using TT - Two Talk Editor!${NC}"
            exit 0 ;;
        *) ;;
    esac
done
