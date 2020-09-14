class PlotCli < Formula
  include Language::Python::Virtualenv

  desc "Command Line Interface for Data Visualization"
  homepage "https://github.com/xkumiyu/plot-cli"
  url "https://files.pythonhosted.org/packages/92/7e/1e186ae050d6cc1048ceed29ffdb85b23c6461cdc7f40adf82e2d0b31b54/plot-cli-0.1.0.tar.gz"
  sha256 "d2490357a093b68570b10a4654ebc2628c92f6715f03727dcfb706d5e6497f5b"

  depends_on "python@3.8"
  depends_on "freetype"
  depends_on "jpeg"
  depends_on "libpng"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/40/a7/ded59fa294b85ca206082306bba75469a38ea1c7d44ea7e1d64f5443d67a/certifi-2020.6.20.tar.gz"
    sha256 "5930595817496dd21bb8dc35dad090f1c2cd0adfaf21204bf6732ca5d8ee34d3"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e/click-7.1.2.tar.gz"
    sha256 "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
  end

  resource "Cycler" do
    url "https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz"
    sha256 "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
  end

  resource "kiwisolver" do
    url "https://files.pythonhosted.org/packages/62/b8/db619d97819afb52a3ff5ff6ad3f7de408cc83a8ec2dfb31a1731c0a97c2/kiwisolver-1.2.0.tar.gz"
    sha256 "247800260cd38160c362d211dcaf4ed0f7816afb5efe56544748b21d6ad6d17f"
  end

  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/58/bd/d3b13e93c01226901ceb50a14c110b5722f446e456f7f4fd7fd231b33742/matplotlib-3.3.1.tar.gz"
    sha256 "87f53bcce90772f942c2db56736788b39332d552461a5cb13f05ff45c1680f0e"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/bf/e8/15aea783ea72e2d4e51e3ec365e8dc4a1a32c9e5eb3a6d695b0d58e67cdd/numpy-1.19.2.zip"
    sha256 "0d310730e1e793527065ad7dde736197b705d0e4c9999775f212b03c44a8484c"
  end

  resource "pandas" do
    url "https://files.pythonhosted.org/packages/64/f1/8fdbd74edfc31625d597717be8c155c6226fc72a7c954c52583ab81a8614/pandas-1.1.2.tar.gz"
    sha256 "b64ffd87a2cfd31b40acd4b92cb72ea9a52a48165aec4c140e78fd69c45d1444"
  end

  resource "Pillow" do
    url "https://files.pythonhosted.org/packages/3e/02/b09732ca4b14405ff159c470a612979acfc6e8645dc32f83ea0129709f7a/Pillow-7.2.0.tar.gz"
    sha256 "97f9e7953a77d5a70f49b9a48da7776dc51e9b738151b22dacf101641594a626"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/c1/47/dfc9c342c9842bbe0036c7f763d2d6686bcf5eb1808ba3e170afdb282210/pyparsing-2.4.7.tar.gz"
    sha256 "c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/be/ed/5bbc91f03fa4c839c4c7360375da77f9659af5f7086b7a7bdda65771c8e0/python-dateutil-2.8.1.tar.gz"
    sha256 "73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/f4/f6/94fee50f4d54f58637d4b9987a1b862aeb6cd969e73623e02c5c00755577/pytz-2020.1.tar.gz"
    sha256 "c35965d010ce31b23eeb663ed3cc8c906275d6be1a34393a1d73a41febf4a048"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/six-1.15.0.tar.gz"
    sha256 "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
  end

  def install
    venv = virtualenv_create(libexec, "python3.8")

    rm_f "pyproject.toml"

    resource("Pillow").stage do
      inreplace "setup.py" do |s|
        sdkprefix = MacOS.sdk_path_if_needed ? MacOS.sdk_path : ""
        s.gsub! "openjpeg.h", "probably_not_a_header_called_this_eh.h"
        s.gsub! "xcb.h", "probably_not_a_header_called_this_eh.h"
        s.gsub! "ZLIB_ROOT = None",
                "ZLIB_ROOT = ('#{sdkprefix}/usr/lib', '#{sdkprefix}/usr/include')"
        s.gsub! "JPEG_ROOT = None",
                "JPEG_ROOT = ('#{Formula["jpeg"].opt_prefix}/lib', '#{Formula["jpeg"].opt_prefix}/include')"
        s.gsub! "FREETYPE_ROOT = None",
                "FREETYPE_ROOT = ('#{Formula["freetype"].opt_prefix}/lib', " \
                                 "'#{Formula["freetype"].opt_prefix}/include')"
      end

      unless MacOS::CLT.installed?
        ENV.append "CFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers"
      end
      venv.pip_install Pathname.pwd
    end

    res = resources.map(&:name).to_set - ["Pillow"]
    res.each do |r|
      venv.pip_install resource(r)
    end

    venv.pip_install_and_link buildpath
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plot --version")
  end
end
