#!/usr/bin/env bash
# Two Talk – tt.sh
# Semantic shorthand helper – updated from TwoTalk.md
set -euo pipefail
BOLD=$'\033[1m'
DIM=$'\033[2m'
RESET=$'\033[0m'
CYAN=$'\033[36m'
GREEN=$'\033[32m'
YELLOW=$'\033[33m'

list_core() {
cat <<'CORE'
@  HUMAN    – People, feelings, identities, existence, relationships       spoken: An
#  OBJECT   – Physical things, materials, entities, structures, components spoken: Ob
!  FORCE    – Action, execution, power, states, intent, errors              spoken: Ve
?  IDEA     – Thoughts, information, data, truth, inquiries, reasoning     spoken: Mo
>  OUT      – External expression, moving forward, deploying, separating   spoken: Ak
<  IN       – Internal perception, retention, privacy, refusal, reduction  spoken: Li
:  TIME     – Schedules, current moments, history, continuous durations   spoken: Ti
^  PLACE    – Locations, positions, regions, contextual environments       spoken: Sa
%  MEASURE  – Quantity, quality, multiples, completeness, similarity       spoken: Me
CORE
}

list_primes() {
cat <<'PRIMES'
@@  I          HUMAN
@#  Who        HUMAN
@!  Feel       HUMAN
@?  Is         HUMAN
@>  You        HUMAN
@<  Have       HUMAN
@:  Live       HUMAN
@^  Stay       HUMAN
@%  We         HUMAN
#@  Body       OBJECT
##  What       OBJECT
#!  Tool       OBJECT
#?  Word       OBJECT
#>  Make       OBJECT
#<  Part       OBJECT
#:  Die        OBJECT
#^  Be         OBJECT
#%  Some       OBJECT
!@  Want       FORCE
!#  Do         FORCE
!!  Go         FORCE
!?  Can        FORCE
!>  Move       FORCE
!<  Refuse     FORCE
!:  Bad        FORCE
!^  Rise       FORCE
!%  Very       FORCE
?@  See        IDEA
?#  Know       IDEA
?!  True       IDEA
??  Wonder     IDEA
?>  Speak      IDEA
?<  Else       IDEA
?:  Why        IDEA
?^  Think      IDEA
?%  Focus      IDEA
>@  Say        OUT
>#  Work       OUT
>!  Give       OUT
>?  Ask        OUT
>>  Far        OUT
><  If         LOGIC
>:  After      OUT
>^  Out        OUT
>%  Big        OUT
<@  Hear       IN
<#  Own        IN
<!  Not        IN
<?  Like       SIMIL
<>  Other      IN
<<  Stop       IN
<:  Before     IN
<^  In         IN
<%  Small      IN
:@  When       TIME
:#  Now        TIME
:!  Soon       TIME
:?  Maybe      TIME
:>  Will       TIME
:<  Was        TIME
::  Long       TIME
:^  Old        TIME
:%  Time       TIME
^@  Here       PLACE
^#  This       PLACE
^!  Up         PLACE
^?  Where      PLACE
^>  Side       PLACE
^<  Down       PLACE
^:  Near       PLACE
^^  Place      PLACE
^%  Across     PLACE
%@  Good       MEASURE
%#  Much       MEASURE
%!  Most       MEASURE
%?  May        MEASURE
%>  More       MEASURE
%<  Less       MEASURE
%:  Limit      MEASURE
%^  All        MEASURE
%%  Same       MEASURE
PRIMES
}

list_top25() {
cat <<'TOP25'
25 MOST USEFUL PAIRS – memorize these first
@@  I      – myself, me
@>  You    – yourself, customer
@%  We     – group, team
>#  Work   – task, perform
>!  Give   – deploy, force
<?  Like   – prefer, enjoy
??  Wonder – ask, query
!?  Can    – able, capable
!>  Move   – travel, shift
!<  Refuse – deny, reject
::  Long   – constantly, perpetual
:!  Soon   – instant, flash
:<  Was    – past, earlier
:>  Will   – subsequent, ahead
:?  Maybe  – shortly, upcoming
:^  Old    – extended, lengthy
^@  Here   – local, nearby
^#  This   – specific, indicated
^<  Down   – under, beneath
^!  Up     – over, superior
^:  Near   – indoor, interior
%>  More   – extra, plus
%<  Less   – scarce, rare
%^  All    – entirely, complete
%%  Same   – identical, equal
TOP25
}

# Unified dictionary mapping canonical values and all secondary synonyms from TwoTalk.md
DICT=$(cat <<'DICT'
@@	I / myself / me / self	HUMAN
@#	Who / person / individual / human	HUMAN
@!	Feel / emotion / sense / experience	HUMAN
@?	Is / exists / equals / represents	HUMAN
@>	You / yourself / customer / recipient	HUMAN
@<	Have / possess / keep / hold	HUMAN
@:	Live / reside / survive / inhabit	HUMAN
@^	Stay / remain / wait / linger	HUMAN
@%	We / group / team / community	HUMAN
#@	Body / anatomy / physical / framework	OBJECT
##	What / object / item / asset	OBJECT
#!	Tool / contact / press / strike	OBJECT
#?	Word / category / type / sort	OBJECT
#>	Make / build / create / produce	OBJECT
#<	Part / component / fraction / element	OBJECT
#:	Die / perish / expire / cease	OBJECT
#^	Be / occurs / present / stands	OBJECT
#%	Some / several / partial / various	OBJECT
!@	Want / desire / wish / intent	FORCE
!#	Do / occur / transpire / unfold	FORCE
!!	Go / execute / perform / run	FORCE
!?	Can / able / capable / permits	FORCE
!>	Move / travel / shift / transfer	FORCE
!<	Refuse / deny / reject / decline	FORCE
!:	Bad / crisis / wrong / faulty	FORCE
!^	Rise / ascend / grow / increase	FORCE
!%	Very / highly / extremely / immensely	FORCE
?@	See / view / observe / witness	IDEA
?#	Know / understand / comprehend / recall	IDEA
?!	True / valid / authentic / correct	IDEA
??	Wonder / ask / query / doubt	IDEA
?>	Speak / talk / discuss / conversing	IDEA
?<	Else / otherwise / alternative / instead	IDEA
?:	Why / since / reason / therefore	IDEA
?^	Think / ponder / analyze / evaluate	IDEA
?%	Focus / core / main / subject	IDEA
>@	Say / state / utter / tell	OUT
>#	Work / task / perform / accomplish	OUT
>!	Give / deploy / force / promote	OUT
>?	Ask / text / phrasing / vocabulary	OUT
>>	Far / route / ship / broadcast	OUT
><	If / split / separate / detached	LOGIC
>:	After / following / subsequent / post	OUT
>^	Out / depart / leave / proceed	OUT
>%	Big / large / massive / extensive	OUT
<@	Hear / listen / register / perceive	IN
<#	Own / personal / private / interior	IN
<!	Not / negate / deny / exclude	IN
<?	Like / prefer / enjoy / favor	SIMIL
<>	Other / alternative / different / foreign	IN
<<	Stop / halt / cease / block	IN
<:	Before / prior / preceding / pre	IN
<^	In / inside / internal / inner	IN
<%	Small / minor / tiny / minimal	IN
:@	When / schedule / clock / period	TIME
:#	Now / current / immediately / presently	TIME
:!	Soon / instant / flash / second	TIME
:?	Maybe / shortly / upcoming / imminent	TIME
:>	Will / subsequent / ahead / upcoming	TIME
:<	Was / past / earlier / historic	TIME
::	Long / constantly / perpetual / endless	TIME
:^	Old / extended / lengthy / distant	TIME
:%	Time / during / span / interval	TIME
^@	Here / local / nearby / present	PLACE
^#	This / specific / indicated / identified	PLACE
^!	Up / over / superior / upper	PLACE
^?	Where / aspect / edge / flank	PLACE
^>	Side / distant / remote / isolated	PLACE
^<	Down / under / beneath / lower	PLACE
^:	Near / indoor / interior / enclosed	PLACE
^^	Place / location / coordinate / venue	PLACE
^%	Across / span / transverse / cross	PLACE
%@	Good / positive / quality / excellent	MEASURE
%#	Much / numerous / multiple / plenty	MEASURE
%!	Most / maximum / majority / highest	MEASURE
%?	May / perhaps / possibly / potential	MEASURE
%>	More / extra / plus / further	MEASURE
%<	Less / scarce / rare / handful	MEASURE
%:	Limit / boundary / threshold / cap	MEASURE
%^	All / entirely / complete / full	MEASURE
%%	Same / identical / equal / uniform	MEASURE
DICT
)

search_dict() {
  echo
  echo "${BOLD}Two Talk search${RESET} – type symbol or English (empty to quit)"
  while true; do
    printf "\n${CYAN}query> ${RESET}"
    IFS= read -r q || break
    [[ -z "$q" ]] && break
    results=$(printf '%s\n' "$DICT" | grep -i -F -- "$q" || true)
    if [[ -z "$results" ]]; then
      echo "  ${DIM}no matches${RESET}"
    else
      printf '%-14s  %-45s  %s\n' "SYMBOL" "MEANING / SYNONYMS" "CAT"
      printf '%s\n' "--------------  ---------------------------------------------  -------"
      printf '%s\n' "$results" | sort -u | while IFS=$'\t' read -r sym meaning cat; do
        printf "${GREEN}%-14s${RESET}  %-45s  ${DIM}%s${RESET}\n" "$sym" "$meaning" "$cat"
      done
    fi
  done
}

show_menu() {
  clear
  echo "${BOLD}=========================================="
  echo "      TWO TALK – SEMANTIC SHORTHAND       "
  echo "==========================================${RESET}"
  echo " 1. List 9 Core Symbols"
  echo " 2. List 81 Semantic Primes"
  echo " 3. Interactive Search (Primes & Synonyms)"
  echo " 4. Top 25 Most Useful Pairs"
  echo " 5. Exit"
  echo "------------------------------------------"
}

main() {
  while true; do
    show_menu
    printf "${CYAN}Select option [1-5]: ${RESET}"
    read -r opt
    case "$opt" in
      1) echo; list_core; echo; printf "${DIM}Press enter to return...${RESET}"; read -r _ ;;
      2) echo; list_primes; echo; printf "${DIM}Press enter to return...${RESET}"; read -r _ ;;
      3) search_dict ;;
      4) echo; list_top25; echo; printf "${DIM}Press enter to return...${RESET}"; read -r _ ;;
      5) echo "Goodbye."; exit 0 ;;
      *) echo -e "\n${YELLOW}Invalid option.${RESET}"; sleep 1 ;;
    esac
  done
}

main
