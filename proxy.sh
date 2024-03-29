http_proxy="http://wwwproxy.osakac.ac.jp:8080"
https_proxy=$http_proxy

#環境変数
#ENVCK=$(find .bashrc -type f -print | xargs grep -e "http_proxy=$http_proxy" -e "https_proxy=$https_proxy")
if [ -z "$(grep -e "http_proxy=$http_proxy" ~/.bashrc)" -o -z "$(grep -e "https_proxy=$https_proxy" ~/.bashrc)" ]; then
    echo -e "\n## proxy setting"  >> ~/.bashrc
    echo "export http_proxy=$http_proxy" >> ~/.bashrc
    echo "export https_proxy=$https_proxy" >> ~/.bashrc
    echo "sucaessfully set environment variable"
else
    echo "environment variable already set"
fi

#github
if [ -z $(which git) ]; then
    echo "git not installed! Skip github configuration" 
elif [ "$http_proxy" = "$(git config --global http.proxy)" -o "$https_proxy" = "$(git config --global https.proxy)" ]; then
    echo "github proxy is already set"
else
    git config --global https.proxy $http_proxy
    git config --global https.proxy $https_proxy
    echo "sucaessfully set github proxy"
fi

#wget
if [ -z $(which wget) ]; then
    echo "wget not installed! Skip wget configuration"
elif [ "http_proxy=$http_proxy" = "$(grep -e "http_proxy=$http_proxy" ~/.wgetrc)" -o "https_proxy=$https_proxy" = "$(grep -e "https_proxy=$https_proxy" ~/.wgetrc)" ]; then
    echo "wget proxy is already set"
else
    echo "http_proxy=$http_proxy" >> ~/.wgetrc
    echo "https_proxy=$https_proxy" >> ~/.wgetrc
    echo "sucaessfully set wget proxy"
fi

#curl
if [ -z $(which curl) ]; then
    echo "curl not installed! Skip curl configuration"
elif [ "proxy=$http_proxy" = "$(grep -e "proxy=$http_proxy" ~/.curlrc)" ]; then
    echo "curl proxy is already set"
else
    echo "proxy=$http_proxy" >> ~/.curlrc
    echo "sucaessfully set curl proxy"
fi

