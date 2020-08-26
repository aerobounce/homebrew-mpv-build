<h1 align="center">mpv-build</h1>
<p align="center">Personal tap for mpv, with some customizations.</p>

### Differences from the original formula
- Build only
- **Automatically Installs mpv.app Package**
- **mpv.app Package and mpv bin doesn't co-exist - bin/mpv invokes bin in mpv.app**
- Removed Arguments
    - `--enable-html-build`
- Additional Arguments
    - `--disable-macos-touchbar` [mpv/issues/7047](https://github.com/mpv-player/mpv/issues/7047)
- Custom Options
    - `--with-touchbar`

### Install
```
brew install aerobounce/mpv-build/mpv
```

### Background
- mpv.rb was removed for several reasons: [mpv: migrate to Homebrew/cask](https://github.com/Homebrew/homebrew-core/commit/41444d526c40b93069b7f0c5414539deb0534179)
- mpv is back again as of [mpv 0.30 #45854](https://github.com/Homebrew/homebrew-core/pull/45854) with some changes
  - **mpv.app bundle install process has been removed**
