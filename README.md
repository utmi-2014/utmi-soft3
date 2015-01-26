utmi-soft3 [![Build Status](https://api.travis-ci.org/utmi-2014/utmi-soft3.png)](https://travis-ci.org/utmi-2014/utmi-soft3)
============

ROS pkgs used in the class "Software3".

Outline
---
1. 10/01　イントロダクション(環境設定)
1. 10/08　ロボットオペレーション(ROS)
1. 10/22　ロボット研究言語(Euslisp)
1. 10/29　ロボットモデリング
1. 11/05　ロボットモデリング補足
1. 11/12　ロボットアーキテクチャ
1. 11/19　外部関数インターフェース
1. 11/26　roseus復習
1. 12/03　分散オブジェクト通信
1. 12/10　宣言的プログラミング
1. 01/07　ガベージコレクション
1. 01/14　ソフトウェアライセンス
1. 01/21　オープンソース開発環境
1. 01/28　試験

How to use these ROS pkgs in your catkin workspace
---
このROSパッケージを自分の環境で使うときの設定。
```bash
# clone this repo to the src directory in your catkin workspace
$ mkdir -p ~/catkin_ws/soft3/src
$ cd ~/catkin_ws/soft3/src
$ git clone https://github.com/utmech-2014/utmech-soft3.git

# make it
$ cd ..
$ catkin_make
$ catkin_make install
$ source ~/catkin_ws/soft3/devel/setup.bash

# run samples
$ rosrun beginner_tutorials talker.py
$ rosrun doc20141008 velocity.py
```

How to contribute to this repository
---
contributeの仕方。
* First, fork this repository.
* Setup the git remote target in your local workspace __like below__.
* Change the sources in the branch and send pull requests!
```bash
$ cd ~/catkin_ws/soft3/src/utmech-soft3
$ git branch YOUR-GITHUB-USERNAME
$ git checkout YOUR-GITHUB-USERNAME
$ git remote add YOUR-GITHUB-USERNAME git@github.com:YOUR-GITHUB-USERNAME/utmech-soft3
```

Information for git & GitHub
---
Git tutorial video in Japanese
* [git入門 (全22回) - プログラミングならドットインストール](http://dotinstall.com/lessons/basic_git)

Git Documentation
* [Git -Book](http://git-scm.com/book/ja/v1)

Cheat Sheet
* [GitHub - GIT CHEAT SHEET](https://training.github.com/kit/downloads/github-git-cheat-sheet.pdf)
* [Git Cheatsheet • NDP Software](http://ndpsoftware.com/git-cheatsheet.html)
