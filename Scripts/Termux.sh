#!/data/data/com.termux/files/usr/bin/bash
#Copyright by VITAN @ 2019

blue="\033[36m"
yellow="\033[33m"

function line() {
    echo -e "$blue -------------------------------------------"
}

function logo() {
    echo -e "$blue
 ______
/_  __/__ ______ _  __ ____ __
 / / / -_) __/  ' \/ // /\ \ /
/_/  \__/_/ /_/_/_/\_,_//_\_\  Configer
    "
}

function menu() {
    echo -e "$yellow 0) Exit"
    echo -e "$blue 1) Termux Personalisation 个性化"
    echo -e "$yellow 2) Development environments 开发环境"
    echo -e "$blue 3) Information Security Tools 信息安全工具"
    echo -e "$yellow 4) Practical tools 实用工具"
    echo -e "$blue 5) Eggs 彩蛋"
}

function MenuItem() {
    line
    read -p "Please enter the option number # " MenuItems
    case $MenuItems in
    0)
        exit
        ;;

    1)
        line
        Termux
        TermuxItem
        ;;

    2)
        line
        development
        DevItem
        ;;

    3)
        line
        security
        SeItem
        ;;

    4)
        line
        Tools
        items
        ;;

    5)
        line
        eggs
        EggItem
        ;;

    *)
        echo -e "\033[31m Invalid option number, please try again. \033[0m"
        MenuItem
        ;;
    esac
}

function Termux() {
    echo -e "$blue 0) Back to main menu"
    echo -e "$yellow 1) Blank greetings 空白问候语"
    echo -e "$blue 2) Auxiliary keyboards 辅助键盘"
    echo -e "$yellow 3) Modify the launch greeting 修改启动问候语"
    echo -e "$blue 4) Oh-My-Zsh"
    echo -e "$yellow 5) Replace to Tsinghua Source 切换到清华园"
    echo -e "$blue 6) Get storage access 获取存储权限"
    echo -e "$yellow 7) Obtaining device information 获取设备信息"
    echo -e "$blue 8) Reload Termux settings 重载Termux设置"
    echo -e "$yellow 9) Stop CPU hibernation 禁止CUP休眠"
    echo -e "$blue 10) Allow CPU hibernation 允许CPU休眠"
    echo -e "$yellow 11) Install Termux-Api 安装Termux-api"
}

function TermuxItem() {
    line
    read -p "Please enter the option number # " option
    case $option in
    0)
        line
        menu
        MenuItem
        ;;

    1)
        touch $HOME/.hushlogin
        echo -e "$yellow Successful"
        line
        Termux
        TermuxItem
        ;;

    2)
        mkdir $HOME/.termux
        echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" >>$HOME/.termux/termux.properties
        echo -e "$blue Successful"
        line
        Termux
        TermuxItem
        ;;

    3)
        vim $PREFIX/etc/motd
        echo -e "$yellow Successful"
        line
        Termux
        TermuxItem
        ;;

    4)
        apt update && apt upgrate
        apt install git zsh curl wget -y
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        chsh -s $(which zsh)
        rm -rf ~/.zshrc
        wget https://raw.githubusercontent.com/ivitan/DotFiles/master/Linux/Termux/zshrc -O ~/.zshrc
        source ~/.zshrc
        echo -e "$blue Successful"
        line
        Termux
        TermuxItem
        ;;

    5)
        sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
        apt update && apt upgrade -y
        echo "Successful！"
        line
        Termux
        TermuxItem
        ;;

    6)
        termux-setup-storage
        line
        Termux
        TermuxItem
        ;;

    7)
        termux-info
        line
        Termux
        TermuxItem
        ;;

    8)
        termux-reload-settings
        line
        Termux
        TermuxItem
        ;;

    9)
        termux-wake-lock
        line
        Termux
        TermuxItem
        ;;

    10)
        termux-wake-unlock
        line
        Termux
        TermuxItem
        ;;

    11)
        pkg install termux-api
        line
        Termux
        TermuxItem
        ;;

    *)
        echo -e "\033[31m Invalid option number, please try again \033[0m"
        Termux
        ;;
    esac
}

function PythonTools() {
    echo -e "$blue 0) Back to main menu"
    echo -e "$yellow 1) Python3"
    echo -e "$blue 2) Jupyter Notebook"
    echo -e "$yellow 3) BeautifulSoup4 & requests"
    echo -e "$blue 4) lxml"
    echo -e "$yellow 5) scrapy"
    echo -e "$blue 6) numpy"
    echo -e "$yellow 7) matplotlib"
    echo -e "$blue 8) pandas & scipy"
    echo -e "$yellow 9) Sklearn"
    echo -e "$blue 10) iPython"
}

function PyItem() {
    line
    read -p "Hit your choice # " PyItems
    case $PyItems in
    0)
        line
        menu
        MenuItem
        ;;

    1)
        echo "Installing Python3"
        pkg install python clang -y
        apt install libxml2 libxslt -y
        apt install openssl libffi openssl-tool -y
        apt install fftw libzmq freetype -y
        apt install libpng pkg-config scrypt -y
        pkg install libcrypt ccrypt libgcrypt -y
        pkg install libjpeg-turbo libllvm openjpeg -y
        while true; do
            read -p "要换 Pypi 源为清华源吗？ [Y/n] " input
            case $input in
            [yY][eE][sS] | [yY])
                echo "正在更换 pip 源..."
                pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
                pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
                break
                ;;
            [nN][oO] | [nN])
                echo "正在更新 pip..."
                pip install pip -U
                break
                ;;
            *)
                echo "输入错误，请重新输入..."
                ;;
            esac
        done
        echo -e "$blue Successful"
        line
        PythonTools
        PyItem
        ;;

    2)
        echo "Installing Jupyter Notebook"
        apt install ndk-sysroot fftw libsodium libzmq freetype libpng glib pkg-config -y
        pip install --upgrade pip
        pip install jupyter
        echo -e "$blue Successful"
        line
        PythonTools
        PyItem
        ;;

    3)
        echo "Installing BeautifulSoup4 requests"
        pip install BeautifulSoup4 requests
        echo -e "$yellow Successful"
        line
        PythonTools
        PyItem
        ;;

    4)
        echo "Installing lxml"
        apt-get install clang libxml2 libxslt -y
        pip install lxml
        echo -e "$blue Successful"
        line
        PythonTools
        PyItem
        ;;

    5)
        echo "Installing scrapy"
        apt install openssl openssl-tool libffi
        pip install scrapy
        echo -e "$yellow Successful"
        line
        PythonTools
        PyItem
        ;;

    6)
        echo "Installing Numpy"
        apt install clang python fftw libzmq freetype libpng pkg-config -y
        pip install numpy
        echo -e "$blue Successful"
        line
        PythonTools
        PyItem
        ;;

    7)
        echo "Installing Matplotlib"
        apt install freetype libpng pkg-config libpng -y
        pip install matplotlib
        echo -e "$yellow Successful"
        line
        PythonTools
        PyItem
        ;;

    8)
        echo "Installing pandas & scipy"
        pip install pandas scipy -y
        echo -e "$blue Successful"
        line
        PythonTools
        PyItem
        ;;

    9)
        echo "Installing Sklearn"
        # 链接到了termux社区一位贡献者(its-pointless)编译的源
        curl -L https://its-pointless.github.io/setup-pointless-repo.sh | sh
        pkg install scipy numpy Sklearn -y
        echo -e "$yellow Successful"
        line
        PythonTools
        PyItem
        ;;

    10)
        apt install -y clang
        pip install ipython
        echo "Successful"
        line
        PythonTools
        PyItem
        ;;

    *)
        echo -e "\033[31m Invalid option number, please try again \033[0m"
        PyItem
        ;;
    esac
}

function Tools() {
    echo -e "$yellow 0) Back to main menu"
    echo -e "$yellow 1) BaiduPCS-Go"
    echo -e "$blue 2) Adb&Fastboot"
    echo -e "$yellow 3) Java"
    echo -e "$blue 4) atilo Linux"
    echo -e "$yellow 5) Nginx"
    echo -e "$blue 6) Apache2"
    echo -e "$blue 7) Tmux"
    echo -e "$yellow 8) Hexo"
    echo -e "$blue 9) OpenSSH SSH"
    echo -e "$yellow 10) Aria2"
    echo -e "$blue 11) You-Get"
    echo -e "$yellow 12) UnblockNeteaseMusic"
    echo -e "$blue 13) KodExplorer"
    echo -e "$yellow 14) ELinks 纯文本浏览器"
    echo -e "$blue 15) MPV 播放器"
    echo -e "$yellow 16) BiliHelper"
    echo -e "$blue 17) CHFS 文件共享"
}

function items() {
    line
    read -p "Please enter the option number：" items
    case $items in
    1)
        echo "Installing BaiduPCS-Go"
        if ! [ -x "$(command -v wget)" ]; then
            apt install wget -y
        fi
        wget https://github.com/iikira/BaiduPCS-Go/releases/latest/download/v3.6.1/BaiduPCS-Go-v3.6.1-linux-arm64.zip -O ~/yun.zip
        if ! [ -x "$(command -v unzip)" ]; then
            apt install unzip -y
        fi
        unzip ~/yun.zip -d ~/yun
        rm -rf ~/yun.zip
        mv ~/yun/BaiduPCS-GO $PREFIX/bin/yun
        chmod -Rf 777 $PREFIX/bin/yun
        echo "Successful. Enter 'yun' to use"
        line
        Tools
        items
        ;;

    2)
        echo "Installing adb and fastboot"
        pkg install adnroid-tools -y
        echo "Successful"
        line
        Tools
        items
        ;;

    3)
        echo "Installing Java-8"
        if ! [ -x "$(command -v wget)" ]; then
            apt install wget -y
        fi
        wget https://github.com/ivitan/Shell/releases/download/Java/java8.deb -O ~/Java.deb
        dpkg -i ~/Java.deb
        rm -rf ~/Java.deb
        echo "Successful"
        line
        Tools
        items
        ;;

    4)
        echo "Installing atilo"
        if ! [ -x "$(command -v wget)" ]; then
            apt install wget -y
        fi
        wget -O ~/atilo.deb https://github.com/ivitan/Shell/releases/download/atilo/atilo.deb
        dpkg -i ~/atilo.deb
        rm -rf ~/atilo.deb
        atilo
        line
        Tools
        items
        ;;

    5)
        pkg install -y nginx
        echo "Successful"
        line
        Tools
        items
        ;;

    6)
        pkg install -y apache2
        echo "Successful"
        line
        Tools
        items
        ;;

    7)
        pkg install -y tmux
        echo "Successful"
        line
        Tools
        items
        ;;

    8)
        pkg install nodejs-lts -y
        git clone -b source https://github.com/iVitan/ivitan.github.io.git $HOME/WorkSpace/Hexo
        git clone https://github.com/ivitan/indigo.git $HOME/WorkSpace/Hexo/themes/indigo
        cd $HOME/WorkSpace/Hexo
        npm install -g hexo-cli
        npm install
        wget https://github.com/ivitan/ivitan.github.io/releases/download/Pin/generator.js -O $HOME/Hexo/node_modules/hexo-generator-index/lib/generator.js
        echo "Successful"
        line
        Tools
        items
        ;;

    9)
        pkg install -y openssh
        read -p "Please enter your SSH username  # " UserName
        git config --global user.name "${UserName}"
        read -p "Please enter your SSH email address  # " UserEmail
        git config --global user.email "${UserEmail}"
        ssh-keygen -t rsa -C "${UserEmail}"
        echo -e "$yellow Successful"
        line
        Tools
        items
        ;;

    10)
        pkg install -y wget aria2 nginx unzip
        echo "Create a profile..."
        mkdir ~/aria2
        wget -O ~/aria2/aria2.conf https://github.com/ivitan/DotFiles/releases/download/V0.01/aria2.conf
        echo "将要从Github上下载AriaNg-1.1.4-AllInOne.zip，此版本更新于2019.10.8，截至2020.2.20为最新版。"
        wget https://github.com/mayswind/AriaNg/releases/download/1.1.4/AriaNg-1.1.4-AllInOne.zip ~/
        if [ -f ~/AriaNg-1.1.4-AllInOne.zip ]; then
            unzip AriaNg-1.1.4-AllInOne.zip
            mv -f ~/index.html $PREFIX/share/nginx/html/index.html
            mv -f ~/LICENSE $PREFIX/share/nginx/html/LICENSE
            echo -e "nginx\naria2c --conf-path=$HOME/aria2/aria2.conf -D" >$PREFIX/bin/startaria2
            echo -e "nginx -s stop\nkillall aria2c" >$PREFIX/bin/stoparia2
            chmod +x $PREFIX/bin/startaria2
            chmod +x $PREFIX/bin/stoparia2
            echo 'Successful！请使用"startaria2"命令打启动Aria2下载服务，使用"stoparia2"命令关闭服务。'
        else
            echo "下载失败！"
        fi
        line
        Tools
        items
        ;;

    11)
        pkg install -y python ffmpeg
        pip install you-get
        echo "Successful"
        line
        Tools
        items
        ;;

    12)
        pkg install -y nodejs
        echo "Updating NPM..."
        npm install -g npm
        npm install -g @nondanee/unblockneteasemusic
        echo "Successful"
        line
        Tools
        items
        ;;

    13)
        echo "Installing Dependency Pack..."
        pkg install -y git
        echo "Clonning KodExplorer..."
        git clone https://gitee.com/kalcaddle/KODExplorer.git
        chmod -Rf 777 ./KODExplorer/*
        echo -e "cd ~/KODExplorer\nphp -S 127.0.0.1:8080 -t ." >/data/data/com.termux/files/usr/bin/startkod
        chmod +x /data/data/com.termux/files/usr/bin/startkod
        echo "Successful！请使用 startkod 命令启动可道云服务，Ctrl+C关闭。"
        line
        Tools
        items
        ;;

    14)
        pkg install -y elinks
        echo "Successful！"
        line
        Tools
        items
        ;;

    15)
        pkg install -y mpv
        echo "Successful"
        line
        Tools
        items
        ;;

    16)
        git clone https://github.com/lkeme/BiliHelper-personal.git
        echo "Installing Dependency Pack..."
        pkg install -y php
        php -r "readfile('https://install.phpcomposer.com/installer');" | php
        mv -f ~/composer.phar ~/BiliHelper-personal/
        cd ~/BiliHelper-personal/
        php composer.phar config -g repo.packagist composer https://mirrors.aliyun.com/composer/
        php composer.phar install
        cp ~/BiliHelper-personal/conf/user.conf.example ~/BiliHelper-personal/conf/user.conf
        echo "php ~/BiliHelper-personal/index.php" >$PREFIX/bin/bilihelper
        chmod +x /data/data/com.termux/files/usr/bin/bilihelper
        echo "Successful！修改 ~/BiliHelper-personal/conf/user.conf 修改配置文件，填入自己的帐号信息，并使用 bilihelper 命令运行BiliHelper。"
        line
        Tools
        items
        ;;

    17)
        wget https://iscute.cn/tar/chfs/2.0/chfs-linux-arm64-2.0.zip -O ~/chfs-linux-arm64-2.0.zip
        unzip ~/chfs-linux-arm64-2.0.zip
        cd ~/chfs-linux-arm64-2.0
        chmod +x chfs
        ./chfs --port=8080 --path="/storage" --allow=192.168.0.1-192.168.0.200 --rule="::r|zsxwz:a1314520:r:Download:rw"
        echo "Successful，open 192.168.XXX.XXX:8080"
        line
        Tools
        items
        ;;

    0)
        line
        menu
        MenuItem
        ;;

    *)
        echo -e "\033[31m Invalid option number, please try again \033[0m"
        items
        ;;
    esac
}

function development() {
    echo -e "$yellow 0) Back to main menu"
    echo -e "$yellow 1) vim"
    echo -e "$blue 2) Python"
    echo -e "$yellow 3) C/C++"
    echo -e "$blue 4) Node.js JavaScript "
    echo -e "$yellow 5) MariaDB"
    echo -e "$blue 6) PHP"
    echo -e "$yellow 7) Go"
    echo -e "$blue 8) JAVA"
    echo -e "$yellow 9) SSH"
}

function DevItem() {
    line
    read -p "Please enter the option number：" DevItems
    case $DevItems in
    0)
        line
        menu
        MenuItem
        ;;

    1)
        echo "Installing Vim..."
        apt install vim wget -y
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        wget https://raw.githubusercontent.com/ivitan/DotFiles/master/Linux/Termux/vimrc -O ~/.vimrc
        vim +PlugInstall +qall
        echo -e "$blue Successful"
        line
        development
        DevItem
        ;;

    2)
        line
        PythonTools
        PyItem
        ;;

    3)
        echo "Installing clang..."
        apt update
        apt install -y clang
        echo "Installing make..."
        apt install -y make
        echo "Installing build-essential..."
        apt install -y build-essential
        echo "Installing GDB..."
        apt install -y gdb
        echo "Successful..."
        line
        development
        DevItem
        ;;

    4)
        echo "Installing Node.js..."
        pkg install -y nodejs
        while true; do
            read -p "你要切换NPM源为淘宝源吗？ [Y/n] " input
            case $input in
            [yY][eE][sS] | [yY])
                echo "正在切换 NPM 源..."
                npm config set registry http://registry.npm.taobao.org/
                npm install -g npm
                break
                ;;
            [nN][oO] | [nN])
                echo "正在更新NPM..."
                npm install -g npm
                break
                ;;
            *)
                echo "输入错误，请重新输入..."
                ;;
            esac
        done
        echo "Node.jsSuccessful..."
        line
        development
        DevItem
        ;;
    5)
        pkg install -y mariadb
        echo "Installing ..."
        mysql_install_db
        echo "Successful"
        line
        development
        DevItem
        ;;

    6)
        pkg install -y php
        line
        development
        DevItem
        ;;

    7)
        echo "Installing golang..."
        pkg install -y golang
        echo "Installing golang-doc..."
        pkg install -y golang-doc
        echo "Successful..."
        line
        development
        DevItem
        ;;

    8)
        echo "Installing Java8"
        if ! [ -x "$(command -v wget)" ]; then
            apt install wget -y
        fi
        wget https://github.com/ivitan/Shell/releases/download/Java/java8.deb -O ~/Java.deb
        dpkg -i ~/Java.deb
        rm -rf ~/Java.deb
        echo "Successful"
        line
        development
        DevItem
        ;;

    9)
        apt install openssh -y
        read -p "Please enter your SSH username # " UserName
        git config --global user.name "${UserName}"
        read -p "Please enter your SSH email address # " UserEmail
        git config --global user.email "${UserEmail}"
        ssh-keygen -t rsa -C "${UserEmail}"
        echo -e "$yellow Successful"
        line
        development
        DevItem
        ;;

    *)
        echo -e "\033[31m Invalid option number, please try again \033[0m"
        DevItem
        ;;
    esac
}

function security() {
    echo -e "$yellow 0) Back to main menu"
    echo -e "$blue 1) Metasploit"
    echo -e "$yellow 2) Nmap"
    echo -e "$blue 3) Hydra"
    echo -e "$yellow 4) SSLscan"
    echo -e "$blue 5) whatportis"
    echo -e "$yellow 6) SQLmap"
    echo -e "$blue 7) RouterSploit"
    echo -e "$yellow 8) Slowloris"
    echo -e "$blue 9) RED HAWK "
    echo -e "$yellow 10) Cupp"
    echo -e "$blue 11) Hash-Buster"
    echo -e "$yellow 12) WPSeku"
    echo -e "$blue 13) XSStrike"
}

function SeItem() {
    line
    read -p "Please enter the option number：" SeItems
    case $SeItems in
    0)
        line
        menu
        MenuItem
        ;;

    2)
        pkg install -y unstable-repo
        pkg install -y metasploit
        echo "Successful"
        line
        security
        SeItem
        ;;

    3)
        pkg install -y hydra
        echo "Successful"
        line
        security
        SeItem
        ;;

    4)
        pkg install -y unstable-repo
        pkg install -y sslscan
        echo "Successful"
        line
        security
        SeItem
        ;;

    5)
        pip install whatportis
        echo "Successful"
        line
        security
        SeItem
        ;;

    6)
        pip install sqlmap
        echo "Successful"
        line
        security
        SeItem
        ;;

    7)
        git clone https://www.github.com/threat9/routersploit ~/routersploit
        cd routersploit
        pip install -r requirements.txt
        python rsf.py
        echo "Successful"
        line
        security
        SeItem
        ;;

    8)
        pip install slowloris
        echo "Successful"
        line
        security
        SeItem
        ;;

    9)
        pkg install -y php
        git clone https://github.com/Tuhinshubhra/RED_HAWK.git ~/RED_HAWK
        cd ~/RED_HAWK
        php rhawk.php
        echo "Successful"
        line
        security
        SeItem
        ;;

    10)
        git clone https://github.com/Mebus/cupp.git ~/cupp
        cd ~/cupp
        python cupp.py
        echo "Successful"
        line
        security
        SeItem
        ;;

    11)
        git clone https://github.com/UltimateHackers/Hash-Buster.git ~/Hash-Buster
        cd ~/Hash-Buster
        python hash.py
        echo "Successful"
        line
        security
        SeItem
        ;;
    12)
        git clone https://github.com/m4ll0k/WPSeku.git ~/wpseku
        cd ~/wpseku
        pip install -r requirements.txt
        python wpseku.py
        echo "Successful"
        line
        security
        SeItem
        ;;

    13)
        git clone https://github.com/UltimateHackers/XSStrike.git ~/XSStrike
        cd ~/XSStrike
        pip install -r requirements.txt
        python xsstrike.py
        echo "Successful"
        line
        security
        SeItem
        ;;

    *)
        echo -e "\033[31m Invalid option number, please try again \033[0m"
        SeItem
        ;;
    esac
}

function eggs() {
    echo -e "$yellow 0) Back to main menu"
    echo -e "$blue 1) screenfetch"
    echo -e "$yellow 2) neofetch"
    echo -e "$blue 3) sl train"
    echo -e "$yellow 4) cmatrix"
    echo -e "$blue 5) nyancat"
    echo -e "$yellow 6) fortune"
    echo -e "$blue 7) apt moo"
    echo -e "$yellow 8) telnet Start Wars"
}

function EggItem() {
    line
    read -p "Please enter the option number：" EggItems
    case $EggItems in
    0)
        line
        menu
        MenuItem
        ;;
    1)
        pkg install -y screenfetch
        screenfetch
        line
        eggs
        EggItem
        ;;

    2)
        pkg install -y neofetch
        neofetch
        line
        eggs
        EggItem
        ;;

    3)
        pkg install -y sl
        sl
        line
        eggs
        EggItem
        ;;

    4)
        pkg install -y cmatrix
        cmatrix
        line
        eggs
        EggItem
        ;;
    5)
        pkg install -y nyancat
        nyancat
        line
        eggs
        EggItem
        ;;

    6)
        pkg install -y fortune
        fortune
        line
        eggs
        EggItem
        ;;

    7)
        apt-get moo
        line
        eggs
        EggItem
        ;;

    8)
        pkg install -y telnet
        telnet towel.blinkenlights.nl
        line
        eggs
        EggItem
        ;;

    *)
        echo -e "\033[31m Invalid option number, please try again \033[0m"
        EggItem
        ;;
    esac
}

logo
line
menu
MenuItem