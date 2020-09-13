class CaseStyleChanger < Formula
  include Language::Python::Virtualenv

  desc "Case Style Changer - a CLI."
  homepage "https://github.com/xkumiyu/case-style-changer"
  url "https://github.com/xkumiyu/case-style-changer/archive/0.1.2.tar.gz"
  sha256 "8a9202c1bcf5cf433e3ac7a7ec322371d59b570eca8b101090a9aa2f13d5eea1"

  depends_on "python@3.8"

  def install
    virtualenv_install_with_resources
  end
end
