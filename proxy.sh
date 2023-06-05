http_proxy="http://wwwproxy.osakac.ac.jp:8080"
https_proxy=$http_proxy

#環境変数
echo -e "\n## proxy setting"  >> ~/.bashrc
echo "export http_proxy=$http_proxy" >> ~/.bashrc
echo "export https_proxy=$https_proxy" >> ~/.bashrc

#github
GIT=$(which git)
if [ -z $GIT ]; then
    echo "git not installed"
    echo "Skip github configuration" 
    exit 1
else
    git config --global https.proxy $http_proxy
    git config --global https.proxy $https_proxy
    echo "sucaessfully set github proxy"
fi

#wget
WGET=$(which wget)
if [ -z $WGET ]; then
    echo "wget not installed! Skip wget configuration"
    exit 1
else
    echo "http_proxy=$http_proxy" >> ~/.wgetrc
    echo "https_proxy=$https_proxy" >> ~/.wgetrc
    echo "sucaessfully set wget proxy"
fi

#curl
CURL=$(which curl)
if [ -z $CURL ]; then
    echo "curl not installed! Skip curl configuration"
    exit 1
else
    echo "proxy=$http_proxy" >> ~/.curlrc
    echo "sucaessfully set curl proxy"
fi

