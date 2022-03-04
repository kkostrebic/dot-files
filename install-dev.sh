#!/usr/bin/env bash

sudo apt update

# Programming language specific packages

# golang - go programming language compiler
# default-jdk - java runtime (jre) or java compatible development kit (openjdk)

sudo apt install --no-install-recommends -y \
  golang \
  default-jdk

# Linters

# tidy - HTML/XML syntax checker and reformatter
# shellcheck - lint tool for shell scripts
# libxml2-utils - package provides xmllint, a tool for validating and reformatting XML documents, and xmlcatalog, a tool to parse and manipulate XML or SGML catalog files

sudo apt install --no-install-recommends -y \
  shellcheck \
  tidy

# Small tools/apps/utils

# feh - fast, lightweight image viewer
# mupdf - micro pdf viewer
# thunar - file manager (xfce)
# vim-gtk3 - vim with gtk3 gui
# universal-ctags - tool that parses source code and produces a sort of index mapping the names of significant entities (e.g. functions, classes, variables)
# wkhtmltopdf - cli utilities to convert html to pdf or image using webkit

sudo apt install --no-install-recommends -y \
  feh \
  mupdf \
  thunar \
  vim-gtk3 \
  universal-ctags \
  wkhtmltopdf
