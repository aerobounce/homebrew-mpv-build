class MpvAlt < Formula
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io"
  url "https://github.com/mpv-player/mpv/archive/v0.34.1.tar.gz"
  sha256 "32ded8c13b6398310fa27767378193dc1db6d78b006b70dbcbd3123a1445e746"
  version "0.34.1-build"
  license :cannot_represent
  head "https://github.com/mpv-player/mpv.git", branch: "master"

  option "with-disable-macos-touchbar", "disable macOS Touch Bar support"
  option "with-disable-macos-media-player", "disable macOS Media Player support"
  option "with-disable-binary-install", "mpv.app will only be installed"

  depends_on "docutils" => :build
  depends_on "pkg-config" => :build
  depends_on "python@3.9" => :build
  depends_on xcode: :build

  depends_on "homebrew-ffmpeg/ffmpeg/ffmpeg"
  depends_on "jpeg"
  depends_on "libarchive"
  depends_on "libass"
  depends_on "little-cms2"
  depends_on "luajit-openresty"
  depends_on "mujs"
  depends_on "uchardet"
  depends_on "vapoursynth"
  depends_on "yt-dlp"

  def install
    # LANG is unset by default on macOS and causes issues when calling getlocale
    # or getdefaultlocale in docutils. Force the default c/posix locale since
    # that's good enough for building the manpage.
    ENV["LC_ALL"] = "C"

    # libarchive is keg-only
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["libarchive"].opt_lib/"pkgconfig"
    # luajit-openresty is keg-only
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["luajit-openresty"].opt_lib/"pkgconfig"

    args = %W[
      --prefix=#{prefix}
      --enable-javascript
      --enable-libmpv-shared
      --enable-lua
      --enable-libarchive
      --enable-uchardet
      --confdir=#{etc}/mpv
      --datadir=#{pkgshare}
      --mandir=#{man}
      --docdir=#{doc}
      --zshdir=#{zsh_completion}
      --lua=luajit
    ]

    # Options
    args << "--disable-macos-touchbar" if build.with? "disable-macos-touchbar"
    args << "--disable-macos-media-player" if build.with? "disable-macos-media-player"

    system Formula["python@3.9"].opt_bin/"python3", "bootstrap.py"
    system Formula["python@3.9"].opt_bin/"python3", "waf", "configure", *args

    if build.with? "disable-binary-install"
      system Formula["python@3.9"].opt_bin/"python3", "waf", "build"
      system Formula["python@3.9"].opt_bin/"python3", "TOOLS/osxbundle.py", "build/mpv"

      prefix.install "build/mpv.app"

      (bin/"mpv").write <<~EOS
        #!/bin/bash
        exec "#{prefix}/mpv.app/Contents/MacOS/mpv" "$@"
      EOS
      chmod "+x", bin/"mpv"

    else
      system Formula["python@3.9"].opt_bin/"python3", "waf", "install"
      system Formula["python@3.9"].opt_bin/"python3", "TOOLS/osxbundle.py", "build/mpv"

      prefix.install "build/mpv.app"
    end
  end

  test do
    system bin/"mpv", "--ao=null", test_fixtures("test.wav")
    assert_match "vapoursynth", shell_output(bin/"mpv --vf=help")
  end
end
