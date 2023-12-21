# create a group and a system user for Prometheus.
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
# create a few directories To store configuration files and libraries for Prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
# Download Prometheus and Extract Files
apt install curl -y
mkdir -p /tmp/prometheus
cd /tmp/prometheus
curl -s https://api.github.com/repos/prometheus/prometheus/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -
tar xvf prometheus*.tar.gz
cd /tmp/prometheus/prometheus-2.46.0.linux-amd64
mv prometheus promtool /usr/local/bin/
# Setting up Prometheus
mv prometheus.yml /etc/prometheus/prometheus.yml
mv consoles/ console_libraries/ /etc/prometheus/
#
#
for i in rules rules.d files_sd; do sudo chown -R prometheus:prometheus /etc/prometheus/${i}; done
for i in rules rules.d files_sd; do sudo chmod -R 775 /etc/prometheus/${i}; done
chown -R prometheus:prometheus /var/lib/prometheus/

systemctl daemon-reload
systemctl enable prometheus