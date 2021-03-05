<h1 align="center">mpv-build 🛠</h1>
<p align="center">Personal tap for mpv, with some customizations.</p>

### Differences from the Original Formula
- Build only
- ✨ Automatically Installs mpv.app Package 📦
- Custom options
    - `disable-macos-touchbar`
    - `disable-macos-media-player`
    - `disable-binary-install`
- Removed Arguments
    - `--enable-html-build`
- Offers `mpv-alt` which depends on `homebrew-ffmpeg/ffmpeg/ffmpeg`
    - The only difference is `ffmpeg` dependency, options and commands remains the same

### Install
```sh
brew install aerobounce/mpv-build/mpv
# OR
brew install aerobounce/mpv-build/mpv-alt
```

### Install with options
```sh
brew install --formula aerobounce/homebrew-mpv-build/mpv --with-<OPTION> ...

# Example:
brew install --formula aerobounce/homebrew-mpv-build/mpv --with-disable-macos-media-player
```

### Background
- mpv.rb was removed for several reasons: [mpv: migrate to Homebrew/cask](https://github.com/Homebrew/homebrew-core/commit/41444d526c40b93069b7f0c5414539deb0534179)
- mpv is back again as of [mpv 0.30 #45854](https://github.com/Homebrew/homebrew-core/pull/45854) with some changes
  - **mpv.app bundle install process has been removed**
