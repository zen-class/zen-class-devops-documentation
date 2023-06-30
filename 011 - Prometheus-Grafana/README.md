# Prometheus-Grafana

## What is Prometheus?

Prometheus is an open-source systems monitoring and alerting toolkit originally built at SoundCloud. Since its inception in 2012, many companies and organizations have adopted Prometheus, and the project has a very active developer and user community. It is now a standalone open source project and maintained independently of any company. To emphasize this, and to clarify the project’s governance structure, Prometheus joined the Cloud Native Computing Foundation in 2016 as the second hosted project, after Kubernetes.

## — prometheus.io

Prometheus doesn’t use protocols such as SMNP or some sort of agent service. Instead, it pulls (scrapes) metrics from a client (target) over http and places the data into its local time series database that you can query using its own DSL.

Prometheus uses exporters that are installed and configured on the clients in order to convert and expose their metrics in a Prometheus format. The Prometheus server then scrapes the exporter for metrics.

By default Prometheus comes with a UI that can be accessed on port 9090 on the Prometheus server. Users also have the ability to build dashboards and integrate their favorite visualization software, such as Grafana.

Prometheus uses a separate component for alerting called the AlertManager. The AlertManager receives metrics from the Prometheus server and then is responsible for grouping and making sense of the metrics and then forwarding an alert to your chosen notification system. The AlertManager currently supports email, Slack, VictorOps, HipChat, WebHooks and many more.

### Important terms :

### Prometheus Server : 
  The main server that scrapes and stores the scraped metrics in a time series DB.
### Scrape : 
  Prometheus server uses a pulling method to retrieve metrics.
### Target : 
  The Prometheus servers clients that it retrieves info from.
### Exporter : 
  Target libraries that convert and export existing metrics into Prometheus format.
### Alert Manager : 
  Component responsible for handling alerts.

### Prometheus Architecture.
![1_CREV9H84LfEIouQCVx7cEw (1)](https://github.com/zen-class/zen-class-devops-documentation/assets/36299748/8a4f6b73-7bc0-4de1-a912-7cb337efbcf7)


Prometheus scrapes metrics from exports, stores them in the TSDB on the Prometheus server and then pushes alerts to Alertmanager.

The Service discovery component is a feature that allows Prometheus to auto discover different targets since these targets will come and go so frequently in a distributed system or microservice orchestration style of architecture. We will not be responsible for continuously updating a static list of target addresses each time a service and/or a piece of infrastructure is removed or added. Prometheus will automatically discover and start/stop scraping for us.

### Setting up Prometheus

  Now that we have the basic understanding of Prometheus,let’s get a Prometheus server up and start scraping some metrics. 
![1_2esHBONOJf-VF53oE05tHQ](https://github.com/zen-class/zen-class-devops-documentation/assets/36299748/7778c253-9567-4812-a4a9-d5bc84c382ab)


### Installing node_exporter
Download the Node Exporter on all machines :
```
wget https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz
Extract the downloaded archive

tar -xf node_exporter-0.15.2.linux-amd64.tar.gz
Move the node_exporter binary to /usr/local/bin:

sudo mv node_exporter-0.15.2.linux-amd64/node_exporter /usr/local/bin
Remove the residual files with:

rm -r node_exporter-0.15.2.linux-amd64*

```

### Create users and service files for node_exporter.

For security reasons, it is always recommended to run any services/daemons in separate accounts of their own. Thus, we are going to create an user account for node_exporter. We have used the -r flag to indicate it is a system account, and set the default shell to /bin/false using -s to prevent logins.
```
sudo useradd -rs /bin/false node_exporter
```

### Create a systemd unit file so that node_exporter can be started at boot. 
```
sudo nano /etc/systemd/system/node_exporter.service
```
```
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
```
Since we have created a new unit file, we must reload the systemd daemon, set the service to always run at boot and start it :
```
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
```

### Installing Prometheus
The next step is to download and install Prometheus only on the Prometheus Server.
```
wget https://github.com/prometheus/prometheus/releases/download/v2.1.0/prometheus-2.1.0.linux-amd64.tar.gz
```

### Extract the Prometheus archive :
```
tar -xf prometheus-2.1.0.linux-amd64.tar.gz
```
### Move the binaries to /usr/local/bin:
```
sudo mv prometheus-2.1.0.linux-amd64/prometheus prometheus-2.1.0.linux-amd64/promtool /usr/local/bin
```
### Create directories for configuration files and other prometheus data.
```
sudo mkdir /etc/prometheus /var/lib/prometheus

```
### Move the configuration files to the directory we made previously:
```
sudo mv prometheus-2.1.0.linux-amd64/consoles prometheus-2.1.0.linux-amd64/console_libraries /etc/prometheus
```
### Delete the leftover files as we do not need them any more:
```
rm -r prometheus-2.1.0.linux-amd64*
```
### Configuring Prometheus
  After having installed Prometheus, we have to configure Prometheus to let it know about the HTTP endpoints it should monitor. Prometheus uses the YAML format for its configuration.

Go to /etc/hosts and add the following lines, replace x.x.x.x with the machine’s corresponding IP address

x.x.x.x prometheus-target-1
x.x.x.x prometheus-target-2
We will use /etc/prometheus/prometheus.yml as our configuration file
```
global:
  scrape_interval: 10s

scrape_configs:
  - job_name: 'prometheus_metrics'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']
  - job_name: 'node_exporter_metrics'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9100','prometheus-target-1:9100','prometheus-target-2:9100']
```



Finally, we will also change the ownership of files that Prometheus will use:
```
sudo useradd -rs /bin/false prometheus
sudo chown -R prometheus: /etc/prometheus /var/lib/prometheus
```
Then, we will create a systemd unit file in /etc/systemd/system/prometheus.service with the following contents :
```
[Unit]
Description=Prometheus
After=network.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
```
Finally, we will reload systemd:
```
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus
```
Prometheus provides a web UI for running basic queries located at http://<your_server_IP>:9090/. This is how it looks like in a web browser:
![1_xNEdWSkZU0zsNHh2-AGr4A](https://github.com/zen-class/zen-class-devops-documentation/assets/36299748/35f72835-daf7-4e41-a79d-ed0042f3a166)

## Setting up Grafana For Prometheus

Install Grafana on instance which queries our Prometheus server.
```
wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.0.4_amd64.deb
sudo apt-get install -y adduser libfontconfig
sudo dpkg -i grafana_5.0.4_amd64.deb
```
Then, Enable the automatic start of Grafana by systemd:
```
sudo systemctl daemon-reload && sudo systemctl enable grafana-server && sudo systemctl start grafana-server.service
```
Grafana is running now, and we can connect to it at http://your.server.ip:3000. The default user and password is admin / admin.
![1_jM2AkGZ2QFF6zys2piJn-A](https://github.com/zen-class/zen-class-devops-documentation/assets/36299748/662e8155-1cf7-4315-95e7-59eb4488149e)

Now you have to create a Prometheus data source:
<ol>
<li>Click on the Grafana logo to open the sidebar.</li>
<li>Click on “Data Sources” in the sidebar.</li>
<li>Choose “Add New”.</li>
<li>Select “Prometheus” as the data source.</li>
<li> Set the Prometheus server URL (in our case: http://localhost:9090/).</li>
<li> Click “Add” to test the connection and to save the new data source.</li>
</ol>
Settings should look like this:

![1_HST-kzbD1bn1VLXHeoNxhw](https://github.com/zen-class/zen-class-devops-documentation/assets/36299748/d74a1556-91e2-497d-b0b3-12e7568dbd6b)

Create your first dashboard from the information collected by Prometheus. You can also import some dashboards from a collection of shared dashboards

![grafana-dashboard-english](https://github.com/zen-class/zen-class-devops-documentation/assets/36299748/d235944a-882b-4e90-a622-30193e908d6d)
