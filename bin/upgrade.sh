#!/usr/bin/env bash

function upgrade() {
  sudo mv /usr/local/ ~/local
}

function recover() {
  sudo mv ~/local /usr/local/
}
