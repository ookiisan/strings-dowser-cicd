## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment before each python command
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# *.py should pass pylint

APP_ROOT := ./strings-dowser

setup:
	# Removes optional existent repo directory
	rm -rf ${APP_ROOT}
	# Clones source repo
	git clone https://github.com/ookiisan/strings-dowser.git
	# Creates python virtualenv
	python3 -m venv ~/.strings-dowser

install:
	. ~/.strings-dowser/bin/activate
	pip3 install --upgrade pip && pip3 install -r ${APP_ROOT}/requirements.txt

lint:
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	. ~/.strings-dowser/bin/activate
	pylint --disable=R,C,W1203 ${APP_ROOT}/*.py

build:
	# Runs build script
	sh ./build_docker.sh

upload:
	# Runs upload script
	sh ./upload_docker.sh

deploy:
	# Runs deploy script
	cd ./k8s && sh ./k8s-apply-all.sh

all: install lint build upload deploy
