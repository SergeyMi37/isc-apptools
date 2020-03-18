## isc-apptools
Application Tools for technical support and DBMS-Ensemble-Interoperability administrator. 

View globals arrays, execute queries (including JDBC/ODBC), sending results to email as XLS files. Viewer class instances with СRUD editing. A few simple graphs on the protocols of the system.

CSP application but based on jQuery-Ui, Uikit, chart.js, jsgrid.js

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation 

Clone/git pull the repo into any local directory

```
$ git clone https://github.com/SergeyMi37/isc-apptools.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## How to Test it

Open IRIS terminal:

```
$ docker-compose exec iris iris session iris
USER>zn "IRISAPP"

IRISAPP>d ##class(App.sys).SaveQuery("%SYSTEM.License:Counts","^test",123)

IRISAPP>zw ^test
^test("%SYSTEM.License:Counts",123,0,1)="InstanceLicenseUse"
^test("%SYSTEM.License:Counts",123,0,2)="License Units"
^test("%SYSTEM.License:Counts",123,1,1)="Total   Authorized LU"
^test("%SYSTEM.License:Counts",123,1,2)=5
...

```
