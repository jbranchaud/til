# View The Source For A Brew Formula

[Homebrew](https://brew.sh/) uses formulas to know how to install things. If
you want to see what a given thing's formula file (written in Ruby) looks like,
there are two ways to get at it.

If you already have the thing installed, the formula is available on your
machine. You can `cat` it to stdout with `brew cat`.

```bash
❯ brew cat bat
```

Here is what `bat` looks like:

```ruby
class Bat < Formula
  desc "Clone of cat(1) with syntax highlighting and Git integration"
  homepage "https://github.com/sharkdp/bat"
  url "https://github.com/sharkdp/bat/archive/v0.17.1.tar.gz"
  sha256 "16d39414e8a3b80d890cfdbca6c0e6ff280058397f4a3066c37e0998985d87c4"
  license "Apache-2.0"

  depends_on "rust" => :build

  uses_from_macos "zlib"

  def install
    ENV["SHELL_COMPLETIONS_DIR"] = buildpath
    system "cargo", "install", *std_cargo_args

    assets_dir = Dir["target/release/build/bat-*/out/assets"].first
    man1.install "#{assets_dir}/manual/bat.1"
    fish_completion.install "#{assets_dir}/completions/bat.fish"
    zsh_completion.install "#{assets_dir}/completions/bat.zsh" => "_bat"
  end

  test do
    pdf = test_fixtures("test.pdf")
    output = shell_output("#{bin}/bat #{pdf} --color=never")
    assert_match "Homebrew test", output
  end
end
```

If you don't have the thing installed, you'll have to access the formula
remotely.

```bash
❯ brew info --github bat
```

This will open up the formula on GitHub in your default browser.
