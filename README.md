# homebrew-mpv-build
Customized formula of mpv. Build only (no bottles).

# Install
- `brew install aerobounce/mpv-build/mpv`
- HEAD: `brew install --HEAD aerobounce/mpv-build/mpv`

# Differences from Brew core's mpv Formula
- No bottles. Build only.
- Depends on `aerobounce/ffmpeg-fdk-aac/ffmpeg` instead of `ffmpeg`.
- Removed some arguments.
  - `--enable-html-build` - Manual can be found at: https://mpv.io/manual/
  - `--docdir=#{doc}`
  - `--zshdir=#{zsh_completion}`
- Addition of an argument.
  - `--disable-macos-touchbar`: See https://github.com/mpv-player/mpv/issues/7047
- **Automatically installs `mpv.app` package.**

# Why
- mpv formula has been removed from homebrew-core.
  - https://github.com/Homebrew/homebrew-core/commit/41444d526c40b93069b7f0c5414539deb0534179
- As of https://github.com/Homebrew/homebrew-core/pull/45854, mpv is back.
  - But obviously it's better to run a tap as what unpredictable changes would happen to it.
- **Building mpv is quite lightweight than you think. It's well structured project.**
