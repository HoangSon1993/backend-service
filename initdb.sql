{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "Prometheus",
      "description": "",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__elements": [],
  "__requires": [
    {
      "type": "panel",
      "id": "gauge",
      "name": "Gauge",
      "version": ""
    },
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "8.5.2"
    },
    {
      "type": "panel",
      "id": "graph",
      "name": "Graph (old)",
      "version": ""
    },
    {
      "type": "datasource",
      "id": "prometheus",
      "name": "Prometheus",
      "version": "1.0.0"
    },
    {
      "type": "panel",
      "id": "stat",
      "name": "Stat",
      "version": ""
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "grafana",
          "uid": "-- Grafana --"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "target": {
          "limit": 100,
          "matchAny": false,
          "tags": [],
          "type": "dashboard"
        },
        "type": "dashboard"
      }
    ]
  },
  "description": "Dashboard for Backend Service(by micrometer-prometheus).",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "gnetId": 6756,
  "graphTooltip": 0,
  "id": null,
  "iteration": 1654853269928,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "DxTyMDjnk"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 54,
      "panels": [],
      "title": "Basic Statistics",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 1,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "s"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 6,
        "x": 0,
        "y": 1
      },
      "id": 52,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "expr": "process_uptime_seconds{application=\"$application\", instance=\"$instance\"}",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "",
          "metric": "",
          "refId": "A",
          "step": 14400,
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "title": "Uptime",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 1,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 70
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 90
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 5,
        "x": 6,
        "y": 1
      },
      "id": 58,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "expr": "sum(jvm_memory_used_bytes{application=\"$application\", instance=\"$instance\", area=\"heap\"})*100/sum(jvm_memory_max_bytes{application=\"$application\",instance=\"$instance\", area=\"heap\"})",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A",
          "step": 14400,
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "title": "Heap Used",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 1,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            },
            {
              "options": {
                "from": -1e+32,
                "result": {
                  "text": "N/A"
                },
                "to": 0
              },
              "type": "range"
            }
          ],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 70
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 90
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 5,
        "x": 11,
        "y": 1
      },
      "id": 60,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "expr": "sum(jvm_memory_used_bytes{application=\"$application\", instance=\"$instance\", area=\"nonheap\"})*100/sum(jvm_memory_max_bytes{application=\"$application\",instance=\"$instance\", area=\"nonheap\"})",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "",
          "refId": "A",
          "step": 14400,
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "title": "Non-Heap Used",
      "type": "gauge"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 16,
        "y": 1
      },
      "hiddenSeries": false,
      "id": 66,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.5.2",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "process_files_open{application=\"$application\", instance=\"$instance\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Open Files",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "process_files_max{application=\"$application\", instance=\"$instance\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Max Files",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Process Open Files",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "locale",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "dateTimeAsIso"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 6,
        "x": 0,
        "y": 4
      },
      "id": 56,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "expr": "process_start_time_seconds{application=\"$application\", instance=\"$instance\"}*1000",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "",
          "metric": "",
          "refId": "A",
          "step": 14400,
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "title": "Start time",
      "type": "stat"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 7
      },
      "hiddenSeries": false,
      "id": 95,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.5.2",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "system_cpu_usage{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "System CPU Usage",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "process_cpu_usage{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Process CPU Usage",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "CPU Usage",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 7
      },
      "hiddenSeries": false,
      "id": 96,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.5.2",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "system_load_average_1m{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Load Average [1m]",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "system_cpu_count{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "CPU Core Size",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Load Average",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "DxTyMDjnk"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 14
      },
      "id": 48,
      "panels": [],
      "title": "JVM Statistics - Memory",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 0,
        "y": 15
      },
      "hiddenSeries": false,
      "id": 85,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.5.2",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "repeat": "memory_pool_heap",
      "repeatDirection": "h",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "jvm_memory_used_bytes{instance=\"$instance\", application=\"$application\", id=\"$memory_pool_heap\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Used",
          "refId": "C",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "jvm_memory_committed_bytes{instance=\"$instance\", application=\"$application\", id=\"$memory_pool_heap\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Commited",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "jvm_memory_max_bytes{instance=\"$instance\", application=\"$application\", id=\"$memory_pool_heap\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Max",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "$memory_pool_heap (heap)",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 6,
        "x": 0,
        "y": 23
      },
      "hiddenSeries": false,
      "id": 88,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.5.2",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "repeat": "memory_pool_nonheap",
      "repeatDirection": "h",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "jvm_memory_used_bytes{instance=\"$instance\", application=\"$application\", id=\"$memory_pool_nonheap\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Used",
          "refId": "C",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "jvm_memory_committed_bytes{instance=\"$instance\", application=\"$application\", id=\"$memory_pool_nonheap\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Commited",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "jvm_memory_max_bytes{instance=\"$instance\", application=\"$application\", id=\"$memory_pool_nonheap\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Max",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "$memory_pool_nonheap (non-heap)",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 23
      },
      "hiddenSeries": false,
      "id": 80,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.5.2",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "irate(jvm_classes_unloaded_total{instance=\"$instance\", application=\"$application\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Classes Unloaded",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Classes Unloaded",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "decimals": 0,
      "fill": 1,
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 39
      },
      "id": 50,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "jvm_classes_loaded{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Classes Loaded",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Classes Loaded",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "decimals": 0,
          "format": "locale",
          "label": "",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 39
      },
      "hiddenSeries": false,
      "id": 83,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.5.2",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "jvm_buffer_memory_used_bytes{instance=\"$instance\", application=\"$application\", id=\"mapped\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Used Bytes",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "jvm_buffer_total_capacity_bytes{instance=\"$instance\", application=\"$application\", id=\"mapped\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Capacity Bytes",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Mapped Buffers",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 46
      },
      "id": 78,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "irate(jvm_gc_memory_allocated_bytes_total{instance=\"$instance\", application=\"$application\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "allocated",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "irate(jvm_gc_memory_promoted_bytes_total{instance=\"$instance\", application=\"$application\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "promoted",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Memory Allocate/Promote",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 47
      },
      "id": 82,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "jvm_buffer_memory_used_bytes{instance=\"$instance\", application=\"$application\", id=\"direct\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Used Bytes",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "jvm_buffer_total_capacity_bytes{instance=\"$instance\", application=\"$application\", id=\"direct\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Capacity Bytes",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Direct Buffers",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 54
      },
      "id": 68,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "jvm_threads_daemon{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Daemon",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "jvm_threads_live{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Live",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "jvm_threads_peak{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Peak",
          "refId": "C",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Threads",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "DxTyMDjnk"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 62
      },
      "id": 72,
      "panels": [],
      "title": "JVM Statistics - GC",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 10,
        "w": 12,
        "x": 0,
        "y": 63
      },
      "id": 74,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": false,
        "hideEmpty": true,
        "hideZero": true,
        "max": true,
        "min": true,
        "show": true,
        "total": true,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "irate(jvm_gc_pause_seconds_count{instance=\"$instance\", application=\"$application\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{action}} [{{cause}}]",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "GC Count",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "locale",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 10,
        "w": 12,
        "x": 12,
        "y": 63
      },
      "id": 76,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": false,
        "hideEmpty": true,
        "hideZero": true,
        "max": true,
        "min": true,
        "show": true,
        "total": true,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "irate(jvm_gc_pause_seconds_sum{instance=\"$instance\", application=\"$application\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{action}} [{{cause}}]",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "GC Stop the World Duration",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "DxTyMDjnk"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 73
      },
      "id": 34,
      "panels": [],
      "title": "HikariCP Statistics",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 4,
        "x": 0,
        "y": 74
      },
      "id": 44,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "expr": "hikaricp_connections{instance=\"$instance\", application=\"$application\", pool=\"$hikaricp\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "title": "Connections Size",
      "type": "stat"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 8,
        "w": 20,
        "x": 4,
        "y": 74
      },
      "id": 36,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "hideEmpty": true,
        "hideZero": false,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
        {
          "expr": "hikaricp_connections_active{instance=\"$instance\", application=\"$application\", pool=\"$hikaricp\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Active",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "hikaricp_connections_idle{instance=\"$instance\", application=\"$application\", pool=\"$hikaricp\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Idle",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "hikaricp_connections_pending{instance=\"$instance\", application=\"$application\", pool=\"$hikaricp\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Pending",
          "refId": "C",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Connections",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 4,
        "x": 0,
        "y": 78
      },
      "id": 46,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "expr": "hikaricp_connections_timeout_total{instance=\"$instance\", application=\"$application\", pool=\"$hikaricp\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "title": "Connection Timeout Count",
      "type": "stat"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 0,
        "y": 82
      },
      "id": 38,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "hikaricp_connections_creation_seconds_sum{instance=\"$instance\", application=\"$application\", pool=\"$hikaricp\"} / hikaricp_connections_creation_seconds_count{instance=\"$instance\", application=\"$application\", pool=\"$hikaricp\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Creation Time",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Connection Creation Time",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 8,
        "y": 82
      },
      "id": 42,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "hikaricp_connections_usage_seconds_sum{instance=\"$instance\", application=\"$application\", pool=\"$hikaricp\"} / hikaricp_connections_usage_seconds_count{instance=\"$instance\", application=\"$application\", pool=\"$hikaricp\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Usage Time",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Connection Usage Time",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 16,
        "y": 82
      },
      "id": 40,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "hikaricp_connections_acquire_seconds_sum{instance=\"$instance\", application=\"$application\", pool=\"$hikaricp\"} / hikaricp_connections_acquire_seconds_count{instance=\"$instance\", application=\"$application\", pool=\"$hikaricp\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Acquire Time",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Connection Acquire Time",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "DxTyMDjnk"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 88
      },
      "id": 18,
      "panels": [],
      "title": "HTTP Statistics",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 89
      },
      "id": 4,
      "legend": {
        "alignAsTable": true,
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "irate(http_server_requests_seconds_count{instance=\"$instance\", application=\"$application\", uri!~\".*actuator.*\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{method}} [{{status}}] - {{uri}}",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Request Count",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 96
      },
      "id": 2,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": false,
        "max": true,
        "min": true,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "irate(http_server_requests_seconds_sum{instance=\"$instance\", application=\"$application\", exception=\"None\", uri!~\".*actuator.*\"}[5m]) / irate(http_server_requests_seconds_count{instance=\"$instance\", application=\"$application\", exception=\"None\", uri!~\".*actuator.*\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{method}} [{{status}}] - {{uri}}",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Response Time",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "label": "",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "DxTyMDjnk"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 103
      },
      "id": 22,
      "panels": [],
      "title": "Tomcat Statistics",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "locale"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 4,
        "x": 0,
        "y": 104
      },
      "id": 28,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "expr": "tomcat_global_error_total{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "title": "Total Error Count",
      "type": "stat"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "decimals": 0,
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 9,
        "x": 4,
        "y": 104
      },
      "id": 24,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "tomcat_sessions_active_current{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "active sessions",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Active Sessions",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "label": "",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 11,
        "x": 13,
        "y": 104
      },
      "id": 26,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "irate(tomcat_global_sent_bytes_total{instance=\"$instance\", application=\"$application\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Sent Bytes",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "irate(tomcat_global_received_bytes_total{instance=\"$instance\", application=\"$application\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Recieved Bytes",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Sent & Recieved Bytes",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "locale"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 4,
        "x": 0,
        "y": 108
      },
      "id": 32,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "expr": "tomcat_threads_config_max{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "title": "Thread Config Max",
      "type": "stat"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 13,
        "x": 0,
        "y": 111
      },
      "id": 30,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "tomcat_threads_current{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Current thread",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        },
        {
          "expr": "tomcat_threads_busy{instance=\"$instance\", application=\"$application\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Current thread busy",
          "refId": "B",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "Threads",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "DxTyMDjnk"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 118
      },
      "id": 8,
      "panels": [],
      "title": "Logback Statistics",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 119
      },
      "id": 6,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": true,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "",
          "expr": "irate(logback_events_total{instance=\"$instance\", application=\"$application\", level=\"info\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "info",
          "rawSql": "SELECT\n  $__time(time_column),\n  value1\nFROM\n  metric_table\nWHERE\n  $__timeFilter(time_column)\n",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "INFO logs",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 119
      },
      "id": 10,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": true,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "",
          "expr": "irate(logback_events_total{instance=\"$instance\", application=\"$application\", level=\"error\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "error",
          "rawSql": "SELECT\n  $__time(time_column),\n  value1\nFROM\n  metric_table\nWHERE\n  $__timeFilter(time_column)\n",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "ERROR logs",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 8,
        "x": 0,
        "y": 126
      },
      "id": 14,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": true,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "",
          "expr": "irate(logback_events_total{instance=\"$instance\", application=\"$application\", level=\"warn\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "warn",
          "rawSql": "SELECT\n  $__time(time_column),\n  value1\nFROM\n  metric_table\nWHERE\n  $__timeFilter(time_column)\n",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "WARN logs",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 8,
        "x": 8,
        "y": 126
      },
      "id": 16,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": true,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "",
          "expr": "irate(logback_events_total{instance=\"$instance\", application=\"$application\", level=\"debug\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "debug",
          "rawSql": "SELECT\n  $__time(time_column),\n  value1\nFROM\n  metric_table\nWHERE\n  $__timeFilter(time_column)\n",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "DEBUG logs",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 8,
        "x": 16,
        "y": 126
      },
      "id": 20,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": true,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "",
          "expr": "irate(logback_events_total{instance=\"$instance\", application=\"$application\", level=\"trace\"}[5m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "trace",
          "rawSql": "SELECT\n  $__time(time_column),\n  value1\nFROM\n  metric_table\nWHERE\n  $__timeFilter(time_column)\n",
          "refId": "A",
          "datasource": "${DS_PROMETHEUS}"
        }
      ],
      "thresholds": [],
      "title": "TRACE logs",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "logBase": 1,
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    }
  ],
  "refresh": "5s",
  "schemaVersion": 36,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": [
      {
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "label_values(jvm_classes_loaded_classes, instance)",
        "hide": 0,
        "includeAll": false,
        "label": "Instance",
        "multi": false,
        "name": "instance",
        "options": [],
        "query": {
          "query": "label_values(jvm_classes_loaded_classes, instance)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "label_values(jvm_classes_loaded_classes{instance=\"$instance\"}, application)",
        "hide": 0,
        "includeAll": false,
        "label": "Application",
        "multi": false,
        "name": "application",
        "options": [],
        "query": {
          "query": "label_values(jvm_classes_loaded_classes{instance=\"$instance\"}, application)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "label_values(hikaricp_connections{instance=\"$instance\", application=\"$application\"}, pool)",
        "hide": 0,
        "includeAll": false,
        "label": "HikariCP-Pool",
        "multi": false,
        "name": "hikaricp",
        "options": [],
        "query": {
          "query": "label_values(hikaricp_connections{instance=\"$instance\", application=\"$application\"}, pool)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "",
        "hide": 0,
        "includeAll": true,
        "label": "Memory Pool (heap)",
        "multi": false,
        "name": "memory_pool_heap",
        "options": [],
        "query": {
          "query": "label_values(jvm_memory_used_bytes{application=\"$application\", instance=\"$instance\", area=\"heap\"},id)",
          "refId": "Prometheus-memory_pool_heap-Variable-Query"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "",
        "hide": 0,
        "includeAll": true,
        "label": "Memory Pool (nonheap)",
        "multi": false,
        "name": "memory_pool_nonheap",
        "options": [],
        "query": {
          "query": "label_values(jvm_memory_used_bytes{application=\"$application\", instance=\"$instance\", area=\"nonheap\"},id)",
          "refId": "Prometheus-memory_pool_nonheap-Variable-Query"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "",
  "title": "Backend Service Statistics",
  "uid": "sOae4vCnk",
  "version": 3,
  "weekStart": ""
}