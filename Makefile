PROJECT_NAME ?= dsbtu_licenses
VERSION = $(shell python3 setup.py --version | tr '+' '-')
PROJECT_NAMESPACE ?= PTarasyk
REGISTRY_IMAGE ?= $(PROJECT_NAMESPACE)/$(PROJECT_NAME)

all:
	@echo "make devenv		- Create & setup development virtual environment"
	@echo "make clean		- Remove files created by distutils"
	@echo "make sdist		- Make source distribution"
	@exit 0

clean:
	rm -fr *.egg-info dist

devenv: clean
	rm -rf env
	# створюємо нове оточення і встановлюємо основні + dev залежності
	# з extras_require (див. setup.py)
	python3.8 -m venv env
	env/bin/pip install -Ue '.[dev]'

sdist: clean
	# офіційний спосіб дистрибуції python-модулів
	python3 setup.py sdist