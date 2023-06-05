http_proxy="http://wwwproxy.osakac.ac.jp:8080"
https_proxy=$http_proxy

if [ "export https_proxy=$https_proxy" =  $(grep -e "https_proxy=$https_proxy" ~/.bashrc) ]; then
    echo "yes"
    exit 1
else
    echo "no"
fi

elif [ "http_proxy=$http_proxy" = $(grep -e "http_proxy=$http_proxy" ~/.wgetrc) ]; then
    echo "wget proxy is already set"
    exit 0
else