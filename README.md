# homebrew-mpv-build
Personal tap for mpv.\
Build only.

# Install
```
brew install aerobounce/mpv-build/mpv
```

# Options
```
--with-ffmpeg
    Use homebrew-core's ffmpeg instead of ffmpeg-fdk-aac
--with-touchbar
    Enables macos-touchbar flag
--HEAD
    Install HEAD version
```

# Todo
- [x] Option to use `ffmpeg` instead of `aerobounce/ffmpeg-fdk-aac/ffmpeg`

# Differences from homebrew-core's mpv
- No bottles, build only.
- Depends on `aerobounce/ffmpeg-fdk-aac/ffmpeg` instead of `ffmpeg`.
    - If you prefer, threre is "--with-ffmpeg" option.
- Removed some arguments.
    - `--enable-html-build`
        - Manual can be found at: https://mpv.io/manual/
    - `--docdir=#{doc}`
    - `--zshdir=#{zsh_completion}`
- Addition of an argument.
    - `--disable-macos-touchbar`
    - Detail: [macosx_touchbar: Logs warning about NSLayoutConstraint on macOS 10.15 #7047](https://github.com/mpv-player/mpv/issues/7047)
    - You can enable it with "--with-touchbar" option.
- **Automatically installs `mpv.app` package.**
    - It used to do so. Now not: [mpv 0.30 #45854](https://github.com/Homebrew/homebrew-core/pull/45854#discussion_r341953284)

# Why
- mpv formula has been removed from homebrew-core as of this commit.
    - [mpv: migrate to Homebrew/cask](https://github.com/Homebrew/homebrew-core/commit/41444d526c40b93069b7f0c5414539deb0534179)
- As of [mpv 0.30 #45854](https://github.com/Homebrew/homebrew-core/pull/45854), mpv is back.
    - Obviously it's better to run a tap as it's completely unpredictable what changes would happen.
    - **Completely Pointless** to follow somebody else's policy for what you use everyday frequently.
- **Building mpv is quite lightweight than you think. It's very well structured project!**
