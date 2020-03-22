![apptools](https://github.com/SergeyMi37/isc-apptools/blob/master/doc/favicon.ico)
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
```

Let's create the apptools, apptoolsresr applications and write the mapping of package App in %All
```
IRISAPP>do ##class(App.Installer).CreateProjection()

```
## Use Case Product Management

Initialize interoperability and create a new test product ([thanks Dias](https://openexchange.intersystems.com/package/IRIS-Interoperability-Message-Viewer)) in IRISAPP.
```
IRISAPP>do ##class(App.Production).CreateProduction("IRISAPP", "Test.TestProd", "Ens.MonitorService,Ens.Alerting.AlertManager,Ens.Activity.Operation.REST")

IRISAPP>do ##class(Ens.Director).StartProduction("Test.TestProd")
```

Initialize interoperability and create a new test product in USER.
```
zn "user"
USER>do ##class(App.Production).CreateProduction("USER", "Test.TestProd2", "Ens.MonitorService,Ens.Alerting.AlertManager,Ens.Activity.Operation.REST")

IRISAPP>do ##class(Ens.Director).StartProduction("Test.TestProd2")
```
When you administer more than 2 products, the scheduled server restart turns into a monotonous routine operation of manually stopping each product. To automate this, a set of utilities is used.

Preserve statuse and stop products in all namespace.
```
IRISAPP>do ##class(App.Production).SaveAndStop()
```

All products are stopped, you can restart the server.
After starting the DBMS, you can start all the products that were launched before.
```
IRISAPP>do ##class(App.Production).StartAll()
```

Create message cleaning tasks for all products, leaving in the last 30 days
```
IRISAPP>do ##class(App.Production).CreateTasksPurgeMess(30)
```

Get a class description, optionally with a superclass
```
IRISAPP>do ##class(App.LogInfoPane).GetClassDef("Test.TestProd2","",.def,1)

IRISAPP>zw def
def("ClassName","Ens.Production")=""
def("ClassName","Ens.Production","super") = "%RegisteredObject,Ens.Settings"
def("ClassName","Ens.Settings")=""
def("ClassName","Test.TestProd2") = ""
def("ClassName","Test.TestProd2","super") = "Ens.Production"
def("Methods","ApplySettings","Description") = "Apply multiple settings to a"
...
```

Create html format documentation in the form of tables for all products, including BS. BP BO and all classes that they meet
```
IRISAPP>do ##class(App.Production).GenDoc("/usr/irissys/csp/user/gen-doc.xml")
```

## Use Case Security Management

You can replace the shared password if the password of the predefined system users has been compromised
```
IRISAPP>do ##class(App.security).ChangePassword("NewPass231",##class(App.security).GetPreparedUsers())
```

Application to the LockedDown system, if it was installed with the initial security settings, minimum or normal.
You can get and study the description of the method parameters with such a command, like any other element of any other class.
```
IRISAPP>write ##class(App.msg).man("App.security).LockDown")

Increase system security to LockDown
The method disables services and applications as in LockDown. Deletes the areas "DOCBOOK", "ENSDEMO", "SAMPLES"
The method enables auditing and configures registration of all events in the portal, except for switching the log
and modification of system properties
For all predefined users, change the password and change the properties as in LockDown
        newPassword - new single password instead of SYS. For LockDown security level, it has an 8.32ANP pattern
        sBindings = 1 Service% service_bindings enable
        sCachedirect = 1 Service% service_cachedirect enable
        InactiveLimit = 90
        DemoDelete = 0 Demoens, Samples namespaces are being deleted
		
        AuditOn = 1
        sECP = 1 Service% service_ecp enable
        sBindingsIP - list of ip addresses with a semicolon for which to allow CacheStudio connection.

For ECP configurations, you need to add the addresses of all servers and clients to allow connection on% Net.RemoteConnection to remove "abandoned" tasks
        sCachedirectIP - list of ip addresses with a semicolon for which to allow legacy applications connection.
        sECPIP - list of ip addresses with a semicolon for which to allow connection to the ECP server.
        AuthLDAP = 1 In addition to the password, also enable LDAP authentication
...
```

Apply Security settings to "LockDown"
```
IRISAPP>do ##class(App.security).LockDown("NewPassword123",.msg,1,1,0,0)
```

All other features of the interface part of the software solution can be found in the 
![document](https://github.com/SergeyMi37/isc-apptools/blob/master/doc/Documentation%20AppTools.pdf)
 or in an [article of a Russian resource](https://habr.com/en/post/436042/)
