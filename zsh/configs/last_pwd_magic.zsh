function __record_last_dir() {
  echo $PWD >| ~/.last_pwd
}

chpwd_functions+=(__record_last_dir)


function cdl() {
  [ -s ~/.last_pwd ] && cd $(cat ~/.last_pwd)
}
