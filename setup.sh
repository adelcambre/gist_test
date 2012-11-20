count=1000

rm -rf many_repos/*
while [[ $count -gt 0 ]]; do
  git init many_repos/$count
  cd many_repos/$count
  dd if=/dev/random of=file count=1 bs=1024
  git add file
  git commit -m "Blah"
  cd -
  count=`expr $count - 1`
done

count=1000

rm -rf one_repo/*
git init one_repo
cd one_repo
while [[ $count -gt 0 ]]; do
  git checkout --orphan $count
  git rm -rf .
  dd if=/dev/random of=file count=1 bs=1024
  git add file
  git commit -m "Blah"
  count=`expr $count - 1`
done
