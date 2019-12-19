class Mpv < Formula
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io"
  url "https://github.com/mpv-player/mpv/archive/v0.30.0.tar.gz"
  version "aerobounce-0.30.0"
  sha256 "33a1bcb7e74ff17f070e754c15c52228cf44f2cefbfd8f34886ae81df214ca35"
  head "https://github.com/mpv-player/mpv.git"

  bottle :unneeded

  option "with-ffmpeg", "Use homebrew-core's ffmpeg instead of ffmpeg-fdk-aac"

  if build.with? "ffmpeg"
    depends_on "ffmpeg"
  else
    depends_on "aerobounce/ffmpeg-fdk-aac/ffmpeg"
  end

  depends_on "docutils"
  depends_on "pkg-config"
  depends_on "python"

  depends_on "jpeg"
  depends_on "libarchive"
  depends_on "libass"
  depends_on "little-cms2"
  depends_on "lua@5.1"

  depends_on "mujs"
  depends_on "uchardet"
  depends_on "vapoursynth"
  depends_on "youtube-dl"

  def install
    # LANG is unset by default on macOS and causes issues when calling getlocale
    # or getdefaultlocale in docutils. Force the default c/posix locale since
    # that's good enough for building the manpage.
    ENV["LC_ALL"] = "C"

    args = %W[
      --prefix=#{prefix}
      --enable-javascript
      --enable-libmpv-shared
      --enable-lua
      --enable-libarchive
      --enable-uchardet
      --disable-macos-touchbar
      --confdir=#{etc}/mpv
      --datadir=#{pkgshare}
      --mandir=#{man}
    ]

    system "./bootstrap.py"
    system "python3", "waf", "configure", *args
    system "python3", "waf", "install"

    system "python3", "TOOLS/osxbundle.py", "build/mpv"
    prefix.install "build/mpv.app"
  end

  test do
    system bin/"mpv", "--ao=null", test_fixtures("test.wav")
  end
end
