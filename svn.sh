#!/bin/bash

# Функция для настройки пользователя
set_user() {
    svn propset svn:author "$1" . --force
    svn propset svn:email "$2" . --force
}

# Функция для коммита
commit() {
    rm -rf *
    unzip -oq ./commits/commit"$1".zip -d .
    svn add --force *
    svn commit -m "r$1"
}

# Инициализация репозитория
rm -rf repo
# mkdir svn
# cd svn
svnadmin create repo
REPO_URL="file://$(pwd)/repo"


cd repo
svn mkdir -m "project structure" $REPO_URL/trunk $REPO_URL/branches
cd ..

svn checkout $REPO_URL/trunk/ wc
cd wc
# svn checkout file://$(pwd)/svn svn
# mkdir repo
# svn add repo

# 0
set_user "red" "red@mail.com"
commit 0

# 1
set_user "blue" "blue@mail.com"
svn copy . "branches/feat-1" -m "Create branch feat-1"
svn switch "branches/feat-1"
commit 1

# 2
commit 2

# 3
svn copy . "branches/feat-3" -m "Create branch feat-3"
svn switch "branches/feat-3"
commit 3

# 4
svn copy . "branches/feat-4" -m "Create branch feat-4"
svn switch "branches/feat-4"
commit 4

# 5
set_user "red" "red@mail.com"
commit 5

# 6
svn copy . "branches/feat-6" -m "Create branch feat-6"
svn switch "branches/feat-6"
commit 6

# 7
svn switch "branches/feat-1"
commit 7

# 8
set_user "red" "red@mail.com"
svn switch "trunk"
commit 8

# 9
svn copy . "branches/feat-9" -m "Create branch feat-9"
svn switch "branches/feat-9"
commit 9

# 10
set_user "blue" "blue@mail.com"
svn switch "branches/feat-4"
commit 10

# 11
svn switch "branches/feat-1"
commit 11

# 12
svn switch "branches/feat-6"
commit 12

# 13
set_user "red" "red@mail.com"
svn switch "branches/feat-9"
commit 13

# 14
set_user "blue" "blue@mail.com"
svn switch "branches/feat-3"
commit 14

# 15
set_user "red" "red@mail.com"
svn switch "branches/feat-9"
commit 15

# 16
set_user "blue" "blue@mail.com"
svn copy . "branches/feat-16" -m "Create branch feat-16"
svn switch "branches/feat-16"
commit 16

# 17
svn switch "branches/feat-4"
commit 17

# 18
commit 18

# 19
svn switch "branches/feat-6"
commit 19

# 20
commit 20

# 21
svn switch "branches/feat-4"
svn merge "branches/feat-6"
commit 21

# 22
set_user "red" "red@mail.com"
svn copy . "branches/feat-22" -m "Create branch feat-22"
svn switch "branches/feat-22"
commit 22

# 23
svn switch "trunk"
commit 23

# 24
set_user "blue" "blue@mail.com"
svn switch "branches/feat-1"
commit 24

# 25
svn switch "branches/feat-16"
commit 25

# 26
commit 26

# 27
set_user "red" "red@mail.com"
svn switch "trunk"
svn merge "branches/feat-16"
commit 27

# 28
set_user "blue" "blue@mail.com"
svn switch "branches/feat-4"
commit 28

# 29
set_user "red" "red@mail.com"
svn switch "branches/feat-22"
commit 29

# 30
set_user "blue" "blue@mail.com"
svn switch "branches/feat-1"
svn merge "branches/feat-22"
commit 30

# 31
svn switch "branches/feat-4"
svn merge "branches/feat-1"
commit 31

# 32
svn switch "branches/feat-3"
svn merge "branches/feat-4"
commit 32

# 33
set_user "red" "red@mail.com"
svn switch "trunk"
commit 33

# 34
svn switch "branches/feat-9"
commit 34

# 35
set_user "blue" "blue@mail.com"
svn switch "branches/feat-3"
svn merge "branches/feat-9"
commit 35

# 36
set_user "red" "red@mail.com"
svn switch "trunk"
svn merge "branches/feat-3"
commit 36

# Завершение
svn log --verbose
cd ..