#!/bin/bash

# Функция для настройки пользователя, не получилась
set_user() {
    # svn propset svn:author "$1" . --force
    # svn propset svn:email "$2" . --force
}

# Функция для коммита
commit() {
    svn rm *
    unzip -oq ../../commits/commit"$1".zip -d .
    svn add --force *
    svn commit -m "r$1" --username=$2
}

# Инициализация репозитория
mkdir svn
cd svn
rm -rf repo

# Создание локального репозитория
svnadmin create repo
REPO_URL="file://$(pwd)/repo"

# Создаём структуру проекта
cd repo
svn mkdir -m "project structure" $REPO_URL/trunk $REPO_URL/branches
cd ..

# Создание рабочей копии
svn checkout $REPO_URL/trunk/ wc
cd wc

# 0
set_user "red" "red@mail.com"
commit 0

# 1
set_user "blue" "blue@mail.com"
svn copy . "branches/feat-1" -m "Create branch feat-1"
svn switch $REPO_URL/branches/feat-1
commit 1 blue

# 2
commit 2 blue

# 3
svn copy . "branches/feat-3" -m "Create branch feat-3"
svn switch $REPO_URL/branches/feat-3
commit 3 blue

# 4
svn copy . "branches/feat-4" -m "Create branch feat-4"
svn switch $REPO_URL/branches/feat-4
commit 4 blue

# 5
set_user "red" "red@mail.com"
commit 5 red

# 6
svn copy . "branches/feat-6" -m "Create branch feat-6"
svn switch $REPO_URL/branches/feat-6
commit 6 red

# 7
svn switch $REPO_URL/branches/feat-1
commit 7 red

# 8
set_user "red" "red@mail.com"
svn switch "trunk"
commit 8 red

# 9
svn copy . "branches/feat-9" -m "Create branch feat-9"
svn switch $REPO_URL/branches/feat-9
commit 9 red

# 10
set_user "blue" "blue@mail.com"
svn switch $REPO_URL/branches/feat-4
commit 10 blue

# 11
svn switch $REPO_URL/branches/feat-1
commit 11 blue

# 12
svn switch $REPO_URL/branches/feat-6
commit 12 blue

# 13
set_user "red" "red@mail.com"
svn switch $REPO_URL/branches/feat-9
commit 13 red

# 14
set_user "blue" "blue@mail.com"
svn switch $REPO_URL/branches/feat-3
commit 14 blue

# 15
set_user "red" "red@mail.com"
svn switch $REPO_URL/branches/feat-9
commit 15 red

# 16
set_user "blue" "blue@mail.com"
svn copy . "branches/feat-16" -m "Create branch feat-16"
svn switch $REPO_URL/branches/feat-16
commit 16 blue

# 17
svn switch $REPO_URL/branches/feat-4
commit 17 blue

# # 18
# commit 18 blue

# # 19
# svn switch $REPO_URL/branches/feat-6
# commit 19 blue

# # 20
# commit 20 blue

# # 21
# svn switch $REPO_URL/branches/feat-4
# svn merge "branches/feat-6"
# commit 21 blue

# # 22
# set_user "red" "red@mail.com"
# svn copy . "branches/feat-22" -m "Create branch feat-22"
# svn switch $REPO_URL/branches/feat-22
# commit 22 red

# # 23
# svn switch "trunk"
# commit 23 red

# # 24
# set_user "blue" "blue@mail.com"
# svn switch $REPO_URL/branches/feat-1
# commit 24 blue

# # 25
# svn switch $REPO_URL/branches/feat-16
# commit 25 blue

# # 26
# commit 26 blue

# # 27
# set_user "red" "red@mail.com"
# svn switch "trunk"
# svn merge "branches/feat-16"
# commit 27 red

# # 28
# set_user "blue" "blue@mail.com"
# svn switch $REPO_URL/branches/feat-4
# commit 28 blue

# # 29
# set_user "red" "red@mail.com"
# svn switch $REPO_URL/branches/feat-22
# commit 29 red

# # 30
# set_user "blue" "blue@mail.com"
# svn switch $REPO_URL/branches/feat-1
# svn merge "branches/feat-22"
# commit 30 blue

# # 31
# svn switch $REPO_URL/branches/feat-4
# svn merge "branches/feat-1"
# commit 31 blue

# # 32
# svn switch $REPO_URL/branches/feat-3
# svn merge "branches/feat-4"
# commit 32 blue

# # 33
# set_user "red" "red@mail.com"
# svn switch "trunk"
# commit 33 red

# # 34
# svn switch $REPO_URL/branches/feat-9
# commit 34 red

# # 35
# set_user "blue" "blue@mail.com"
# svn switch $REPO_URL/branches/feat-3
# svn merge "branches/feat-9"
# commit 35 blue

# # 36
# set_user "red" "red@mail.com"
# svn switch "trunk"
# svn merge "branches/feat-3"
# commit 36 red

# Завершение
svn log --verbose
cd ..
