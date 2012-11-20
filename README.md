# A test of using one repo as opposed to many repos for small single commit repos (i.e. gists)

There is a shell script setup.sh that creates 1000 repos, each with one
file with 1k of random data. First it makes 1000 separate repos in the
many_repos/ subdirectory, then it makes 1000 new refs in a single repo at
one_repo/

## Results

### Many repos

I ran this on bare directories, and the results seem fairly consistent.
Each repo with 1k of data in a single file with a single commit takes up
exactly 88k of space. All thousand repos take up 88000k. 

```
gist_test% du -sk many_repos
88000 many_repos
```

I ran git gc on each of the thousand repos and got an interesting result:

```
gist_test% du -sk many_repos
92000 many_repos
```

Run git gc on each of the smaller repos actually increased the space
requirements slightly. Probably due to some overhead in building the
pack files?

### One repo

With a bare repo and making new orphan refs for each "repo", this was
the total space taken. 

```
gist_test% du -sk one_repo
20224 one_repo
```

I then ran git gc on the repo and got the following:

```
gist_test% du -sk one_repo
5548  one_repo
```

