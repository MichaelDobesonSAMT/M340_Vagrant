ECHO OFF
# Reset vagrant home
setx VAGRANT_HOME E:\Compiti\I4AC\Professionale\M340(Virtualizzazione)\Vagrant\VagrantHome

# Execute px
E:\Applications\px-py\px.bat

# Set proxy
set http_proxy=http://localhost:5865
set https_proxy=http://localhost:5865