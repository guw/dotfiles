# macOS specific JDK
# (see also https://gist.github.com/tobias/aab714378333e8a7bbc40f4f1d621147)

if test (uname) = 'Darwin'
	set -gx JAVA_HOME (/usr/libexec/java_home)
end