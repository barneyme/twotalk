#!/bin/bash
################################################################################
# TT - Two Talk Editor
################################################################################
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[38;5;226m'
BLUE='\033[38;5;214m'
CYAN='\033[1;36m'
NC='\033[0m'
CONFIG_DIR="$HOME/.tt"
LAST_FILE_PATH="$CONFIG_DIR/lastfile"
mkdir -p "$CONFIG_DIR" 2>/dev/null
CURRENT_FILE=""
FILE_MODIFIED=false
CONTENT=""
QUICK_EDIT_MODE=false
declare -a TT_DICTIONARY
TT_DICTIONARY+=(
    "@@|self|PERSON" "@#|person|PERSON" "@!|I / me|PERSON" "@?|you|PERSON" "@>|someone|PERSON" "@|young|PERSON" "@:|old|PERSON" "@^|other|PERSON" "@%|group|PERSON"
    "#@|body|THING" "##|thing|THING" "#!|tool|THING" "#?|word|THING" "#>|output|THING" "#<|input|THING" "#:|material|THING" "#^|this|THING" "#%|part|THING"
    "!@|help|VALUE" "!#|purpose|VALUE" "!!|good|VALUE" "!?|need|VALUE" "!>|big|VALUE" "!<|small|VALUE" "!:|bad|VALUE" "!^|true|VALUE" "!%|all|VALUE"
    "?@|feeling|MIND" "?#|sense|MIND" "?!|know|MIND" "??|fact|MIND" "?>|listen|MIND" "?<|think|MIND" "?:|way|MIND" "?^|focus|MIND" "?%|desire|MIND"
    ">@|speech|ACT" ">#|move|ACT" ">!|action|ACT" ">?|ask|ACT" ">>|is|ACT" "><|transfer|ACT" ">:|contact|ACT" ">^|stay|ACT" ">%|act|ACT"
    "<@|hold|STRUCTURE" "<#|type|STRUCTURE" "<!|not|STRUCTURE" "<?|because|STRUCTURE" "<>|same|STRUCTURE" "<<|have|STRUCTURE" "<:|if|STRUCTURE" "<^|with|STRUCTURE" "<%|can|STRUCTURE"
    ":@|life|CHRONIC" ":#|now|CHRONIC" ":!|moment|CHRONIC" ":?|brief|CHRONIC" ":>|future|CHRONIC" ":<|past|CHRONIC" "::|time|CHRONIC" ":^|soon|CHRONIC" ":%|always|CHRONIC"
    "^@|here|SPACE" "^#|side|SPACE" "^!|above|SPACE" "^?|inside|SPACE" "^>|below|SPACE" "^<|far|SPACE" "^:|near|SPACE" "^^|space|SPACE" "^%|distance|SPACE"
    "%@|more|SCALE" "%#|less|SCALE" "%!|very|SCALE" "%?|maybe|SCALE" "%>|many|SCALE" "%<|some|SCALE" "%:|most|SCALE" "%^|few|SCALE" "%%|size|SCALE"
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
        if [ "$FILE_MODIFIED" = true ]; then status="${YELLOW}(modified)${NC}"
        else status="${GREEN}(saved)${NC}"; fi
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
    echo -e "  ${CYAN}g)${NC} Search Notes (grep)"
    echo -e "  ${CYAN}3)${NC} Show Core Symbols Matrix"
    echo -e "  ${CYAN}4)${NC} Show Grammar Rules Reference"
    echo -e "  ${CYAN}6)${NC} Exit TT"
    echo
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
                printf "  ${CYAN}%-10s${NC} -> ${BLUE}%-15s${NC} [%s]\n" "$symbol" "$English" "$type"
                count=$((count+1))
            fi
        done
        read -p "Press [Enter] to query again..."
    done
}
edit_file() {
    while true; do
        show_header
        echo -e "Editing: ${BLUE}$CURRENT_FILE${NC}"
        echo -e "${CYAN}------------------------------------------------------------${NC}"
        if [ -z "$CONTENT" ]; then echo -e "${YELLOW}[Empty File]${NC}"
        else echo "$CONTENT" | awk '{print NR ": " $0}'; fi
        echo -e "${CYAN}------------------------------------------------------------${NC}"
        echo -e "Options: ${CYAN}[a]${NC} Append line  ${CYAN}[d]${NC} Delete line  ${CYAN}[q]${NC} Main Menu"
        read -p "Choice: " -n 1 -r action
        echo
        case $action in
            a|A)
                read -p "Enter text to append: " text
                if [ -z "$CONTENT" ]; then CONTENT="$text"; else CONTENT="$CONTENT$'\n'$text"; fi
                FILE_MODIFIED=true ;;
            d|D)
                read -p "Enter line number to delete: " line_num
                if [[ "$line_num" =~ ^[0-9]+$ ]]; then
                    CONTENT=$(echo "$CONTENT" | sed "${line_num}d")
                    FILE_MODIFIED=true
                fi ;;
            q|Q) break ;;
        esac
    done
}
while true; do
    show_main_menu
    read -p "Select option: " -n 1 -r
    echo
    case $REPLY in
        1|2) echo -e "${YELLOW}Local system paths simulated here.${NC}"; sleep 1 ;;
        e|E)
            if [ -n "$CURRENT_FILE" ]; then edit_file;
            else echo -e "${RED}No file open!${NC}"; sleep 1; fi ;;
        s|S)
            if [ -n "$CURRENT_FILE" ]; then
                echo "$CONTENT" > "$CURRENT_FILE"
                FILE_MODIFIED=false
                echo -e "${GREEN}File saved!${NC}"
                sleep 1
            else echo -e "${RED}No active file to save!${NC}"; sleep 1; fi ;;
        c|C)
            CURRENT_FILE=""
            CONTENT=""
            FILE_MODIFIED=false
            echo -e "${YELLOW}File closed.${NC}"
            sleep 1 ;;
        t|T) two_talk_lookup ;;
        g|G)
            read -p "Enter text to search across system files: " grep_query
            echo -e "${YELLOW}Searching...${NC}"
            sleep 1 ;;
        3)
            show_header
            echo -e "${GREEN}=== Core Symbols Matrix ===${NC}"
            echo -e "  @ People  |  # Objects  |  ! Value"
            echo -e "  ? Mind    |  > Action   |  < Relation"
            echo -e "  : Time    |  ^ Space    |  % Scale"
            echo
            read -p "Press [Enter] to return..." ;;
        4)
            show_header
            echo -e "${GREEN}=== Grammar Rules Reference ===${NC}"
            echo -e "  Order: Left to right (Who > What > When)"
            echo -e "  Negation: Prefix with <! (e.g., <!.>!)"
            echo -e "  Questions: Start line with >?"
            echo -e "  Chaining: Connect primes with dots (@#.!:.>#)"
            echo
            read -p "Press [Enter] to return..." ;;
        6) clear; exit 0 ;;
        *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
    esac
done
