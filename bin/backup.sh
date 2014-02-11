#! /bin/sh
# back up files which have been modified in the last 24 hours in the specified directory 

BACKUPFILE=backup-"`date +%m-%d-%Y`"
archive=${1:-$BACKUPFILE}

#tar cvf - `find . -mtime -1 -type f -print` > $archive.tar
find . -mtime -1 -type f -print0 | xargs -0 tar cvf "$archive.tar"
gzip $archive.tar

echo "Directory $pwd backed up in archive file \"$archive.tar.gz\""

