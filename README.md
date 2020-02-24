# mpv-build
Personal tap for `mpv` with some customizations.

## Differences from homebrew-core's `mpv`
- No Bottles, Build only.
- **Automatically Installs `mpv.app` Package**
    - [mpv 0.30 #45854](https://github.com/Homebrew/homebrew-core/pull/45854#discussion_r341953284)
- ~~Depends on `aerobounce/ffmpeg-fdk-aac/ffmpeg` instead of `ffmpeg`~~
- Removed Arguments
    - `--enable-html-build`
- Additional Arguments
    - `--disable-macos-touchbar` – [macosx_touchbar: Logs warning about NSLayoutConstraint on macOS 10.15 #7047](https://github.com/mpv-player/mpv/issues/7047)

## Install
```
brew install aerobounce/mpv-build/mpv
```

## Options
```
--with-touchbar
    Enables TouchBar module
--HEAD
    Install HEAD version
```

## Todo
- [ ] Add more build options

## Why
1. `mpv` formula has been removed from `homebrew-core` as of this commit: [mpv: migrate to Homebrew/cask](https://github.com/Homebrew/homebrew-core/commit/41444d526c40b93069b7f0c5414539deb0534179)
2. As of [mpv 0.30 #45854](https://github.com/Homebrew/homebrew-core/pull/45854), `mpv` is back with some changes, including deletion of `mpv.app` bundle install process
