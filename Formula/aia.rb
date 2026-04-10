class Aia < Formula
  desc "Agents In Accord — humane handover protocol for Claude Code sessions"
  homepage "https://aiaccord.dev"
  url "https://github.com/mickey-kras/aia/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "23497ae690b9147257d963a05320f614eb8cd969aecbc0073feb94f7b01fae9a"
  license "MIT"
  head "https://github.com/mickey-kras/aia.git", branch: "main"

  depends_on "python@3.12"

  def install
    # Install the whole tree into libexec so lib/, skills/, hooks/, and
    # templates/ all resolve relative to the binary via bin/aia's
    # symlink-aware AIA_ROOT resolution.
    libexec.install "bin", "lib", "skills", "hooks", "templates"

    # Expose the CLI on PATH.
    bin.install_symlink libexec/"bin/aia"
  end

  def caveats
    <<~EOS
      aia is installed, but the Claude Code integration (skill + hook +
      settings entry) is not wired yet. Run this once:

        aia setup

      This installs the /handover skill to ~/.claude/skills/handover,
      the session-start hook to ~/.claude/hooks/aia-session-start.sh,
      and merges a SessionStart entry into ~/.claude/settings.json.

      Before anything else, read the Code of Conduct — it is the
      mutual promise aia is built around:

        https://github.com/mickey-kras/aia/blob/main/CODE_OF_CONDUCT.md

      Docs, Code of Conduct, and case study:

        https://aiaccord.dev
    EOS
  end

  test do
    assert_match "aia 0.1.0", shell_output("#{bin}/aia version")
    assert_match "USAGE", shell_output("#{bin}/aia help")
  end
end
