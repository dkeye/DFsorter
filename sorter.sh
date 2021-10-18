#!/bin/bash

cd $(xdg-user-dir DOWNLOAD)

for file in $(find -maxdepth 1 -type f); do

  case ${file##*.} in # get filename extension
  mp4 | mpeg | avi | webm)
    mv $file $(xdg-user-dir VIDEOS)
    ;;
  jpg | jpeg | png)
    mv $file $(xdg-user-dir PICTURES)
    ;;
  mp3 | ogg | flac)
    mv $file $(xdg-user-dir MUSIC)
    ;;
  torrent)
    mkdir -p torrents
    mv $file torrents
    ;;
  rar | zip | 7z | tar | tgz | gz)
    mkdir -p archives
    mv $file archives
    ;;
  doc | docx | pdf | xls | xlsx)
    mv $file $(xdg-user-dir DOCUMENTS)
    ;;
  fb2 | epub | djvu)
    mkdir -p books
    mv $file books
    ;;
  iso)
    mkdir -p images
    mv $file images
    ;;
  esac
done
