#!/usr/bin/env bash

echo 'The files and database will be destroyed.'
echo 'Are you sure you want to delete the project? (y/N)'

read -r answer
case $answer in
  y)
  docker-compose down -v
  rm -rf project/*
  echo 'The project is destroyed.'
  ;;

  *)
  echo 'Cancelled.'
  ;;
esac
