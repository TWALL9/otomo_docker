# otomo_docker
Dockerfile and other misc files needed to set up the otomo workspace on other PC's

# startup
Note that not all packages may be in the dockerfile. You may need to add more via rosdep

```bash
cd /path/to/workspace
sudo rosdep init
rosdep update
rosdep install --from-paths src -y --ignore-src
```

# running docker
