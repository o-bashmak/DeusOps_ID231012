Для создания VM использовался Vagrantfile
Найстройка требуемых ВМ производилась соглано файлам
• Light:
1.	Разверните три виртуальные машины с linux: web01, db01 и mon01. Можно использовать любые способы создания, например в Яндекс Облаке или локально на Vagrant   # Vagrantfile
2.	Установите сервер баз данных MySQL на виртуальную машину “dbOl"                                                                                               # Vagrantfile  &&   Light. DB01_roadmap.txt
3.	Установите и настройте Nginx на виртуальную машину web01                                                                                                      # Vagrantfile                                
4.	Установите приложение phpmyadmin на виртуальной машине web01 и настройте его для работы с вашим MySQL                                                         # Light. WEB01_roadmap.txt
5.	На виртуальной машине "mon01" установите Grafana и Prometheus                                                                                                 # Grafana.sh   &&   prometheus.sh                      
6.	Установить на "web01" и “db01" Prometheus-exporter и настроить сбор метрик для мониторинга на "mon01"                                                         # Normal.5.txt
7.	Установите на "webOl" приложение по инструкции (https://piwigo.org/guides/install/manual)                                                                     # Light. WEB01_roadmap.txt

• Normal:
5.	Настройте мониторинг Nginx и MySQL в Prometheus, создайте панели мониторинга в Grafana, отображающие основные метрики (например, запросы в секунду, использование CPU и памяти) Nginx и MySQL # Normal.5.txt
