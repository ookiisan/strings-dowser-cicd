## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# *.py should pass pylint

APP_ROOT := ./strings-dowser

setup:
	# Clone source repo
	git clone https://github.com/ookiisan/strings-dowser.git
	#Change directory
	cd ${APP_ROOT}
	# Create python virtualenv & source it
	python3 -m venv ~/.strings-dowser
	source ~/.strings-dowser/bin/activate

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip && pip install -r ${APP_ROOT}/requirements.txt

lint:
	# See local hadolint install instructions: https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 ${APP_ROOT}/*.py

build:
	# Run build script
	sh ./build_docker.sh

upload:
	# Run upload script
	sh ./upload_docker.sh

deploy:
	# Run deploy script
	cd ./k8s && sh ./k8s-apply-all.sh

all: install lint build upload deploy
