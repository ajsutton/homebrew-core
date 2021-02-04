class Osm2pgrouting < Formula
  desc "Import OSM data into pgRouting database"
  homepage "https://pgrouting.org/docs/tools/osm2pgrouting.html"
  url "https://github.com/pgRouting/osm2pgrouting/archive/v2.3.7.tar.gz"
  sha256 "afbe3ff74c9b9b7b1350362fc839e1466335d57f84941af19b5a663fd58aba0c"
  license "GPL-2.0"
  head "https://github.com/pgRouting/osm2pgrouting.git"

  bottle do
    sha256 cellar: :any, big_sur:     "5e935d46ae6532b2cd75b73ebaf13bcbf25472e29e0281236fdd002c3317f3bd"
    sha256 cellar: :any, catalina:    "99b349358db3adfb8a52dfcd2cfde049cecd5cea0b46cc6fa2a4fb6e2e9b4523"
    sha256 cellar: :any, mojave:      "c99a46012e8a582678e3b28e73f8c570606477d2b76d125dee5070fde5516b5c"
    sha256 cellar: :any, high_sierra: "1ec262b471c1dd25b7609b5c36b53798375fb5d1015eb0d968a8023a698ed113"
  end

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "expat"
  depends_on "libpqxx@6"
  depends_on "pgrouting"
  depends_on "postgis"
  depends_on "postgresql"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system bin/"osm2pgrouting", "--help"
  end
end
