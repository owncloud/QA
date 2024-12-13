if [ ! -d QT6 ]; then 
  echo "Create a symlink here called QT6 pointing to the install dir of QT6 with e.g.: ln -s ~/Qt-6-6 QT6"
  echo "Or if docker does not allow symlinks, place here a full copy with e.g.: cp -a ~/Qt-6-6 QT6"
  echo "Retry when done."
  exit 1
fi
docker build -t client-build-linux-qt6 .

