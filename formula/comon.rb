VERSION="0.1.0"
PRODUCT="comon"
class Comon < Formula
  desc "A tool for archiving files and directories and extracting several archive formats."
  homepage "https://github.com/imkeisuke/comon"
  version VERSION
  license "MIT"
  option "without-completions", "Disable completions"
  depends_on "bash-completion@2" => :optional
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/imkeisuke/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_amd64.tar.gz"
    sha256 ""
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/imkeisuke/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_arm64.tar.gz"
    sha256 ""
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/imkeisuke/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_amd64.tar.gz"
    sha256 ""
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/imkeisuke/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_arm64.tar.gz"
    sha256 ""
end
end
def install
  bin.install "comon"
  bash_completion.install "completions/bash/sibling.bash" if build.with? "completions"
  fish_completion.install "completions/fish/sibling.bash" if build.with? "completions"
  zsh_completion.install "completions/zsh/sibling.bash" if build.with? "completions"
end test do
  system "#{bin}/comon --version"
done
