export COLORSCHEME_BACKGROUND=dark

function setdark() {
    echo -e "\033]50;SetProfile=Default\a"
    export COLORSCHEME_BACKGROUND=dark

}
function setlight() {
    echo -e "\033]50;SetProfile=Default Light\a"
    export COLORSCHEME_BACKGROUND=light    
}
