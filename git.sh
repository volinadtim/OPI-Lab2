
#!bin/bash

red() {
	git config --local user.name red
	git config --local user.email red@mail.com
}

blue() {
	git config --local user.name blue
	git config --local user.email blue@mail.com
}

commit() {
	rm -rf *
	unzip -oq ../commits/commit$1.zip -d .
	git commit --allow-empty -am r$1
}

merge() {
	git merge git checkout$1 --no-commit
}

# init
rm -rf git
mkdir git
cd git
git init

# 0
red
commit 0

# 1
blue
git checkout -b feat-1
commit 1

# 2
commit 2

# 3
git checkout -b feat-3
commit 3

# 
git checkout -b feat-4
commit 4

# 5
red
commit 5

# 6
git checkout -b feat-6
commit 6

# 7
git checkout feat-1
commit 7

# 8
red
git checkout master
commit 8

# 9
git checkout -b feat-9
commit 9

# 10
blue
git checkout feat-4
commit 10

# 11
git checkout feat-1
commit 11

# 12
git checkout feat-6
commit 12

# 13
red
git checkout feat-9
commit 13

# 14
blue
git checkout feat-3
commit 14

# 15
red
git checkout feat-9
commit 15

# 16
blue
git checkout -b feat-16
commit 16

# 17
git checkout feat-4
commit 17

# 18
commit 18

# 19
git checkout feat-6
commit 19

# 20
commit 20

# 21
git checkout feat-4
git merge feat-6 --no-commit
commit 21

# 22
red
git checkout -b feat-22
commit 22

# 23
git checkout master
commit 23

# 24
blue
git checkout feat-1
commit 24

# 25
git checkout feat-16
commit 25

# 26
commit 26

# 27
red
git checkout master
git merge feat-16 --no-commit
commit 27

# 28
blue
git checkout feat-4
commit 28

# 29
red
git checkout feat-22
commit 29

# 30
blue
git checkout feat-1
git merge feat-22 --no-commit
commit 30

# 31
git checkout feat-4
git merge feat-1 --no-commit
commit 31

# 32
git checkout feat-3
git merge feat-4 --no-commit
commit 32

# 33
red
git checkout master
commit 33

# 34
git checkout feat-9
commit 34

# 35
blue
git checkout feat-3
git merge feat-9 --no-commit
commit 35

# 36
red
git checkout master
git merge feat-3 --no-commit
commit 36

# end
git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all
cd ..