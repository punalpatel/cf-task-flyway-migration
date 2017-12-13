
***Exemple de migration de données avec **pcf** task et **flyway**.***

Ce blueprint illustre l'utilisation de flyway pour charger une base de données dans le PaaS. Il s'agit d'une application Spring Boot CommandLineRunner enregistrée dans PCF comme une tâche.

Le scheduler pour PCF est ensuite utilisé pour exécuter cette tâche.

Avant d'exécuter les scripts, il faut installer le plugin cf pour le scheduler.
Télécharger la bonne version [ici](https://network.pivotal.io/products/p-scheduler-for-pcf).

Ensuite enregistrez le plugin dans cf comme suit:
```
cf install-plugin [path-to-plugin]
```

Le script [register_task.sh](register_task.sh) enregistre la tâche PCF cf-task-flyway-migration.

Le script [job_create_and_execute.sh](job_create_and_execute.sh) créé une job dans le Scheduler for PCF et l'exécute immédiatement.

Pour ajouter une cédule plutôt qu'une exécution immédiate:

```
cf schedule-job [job-name] [cron-exp]
````

[cron-exp]: min hour day-of-month month day-of-week 

Par exemple pour exécuter la job job-cf-task-flyway-migration à 16h15 le 13 décembre:
```
cf schedule-job job-cf-task-flyway-migration "15 16 13 12 ?"
````
***Attention***: l'heure de cédule est en UTC

Voir la [documentation PCF du scheduler pour plus d'informations](https://docs.pivotal.io/pcf-scheduler/1-1/using-jobs.html)


Pour consulter les données:

[exemple de tunnel ssh vers mysql](https://confluence.dev.desjardins.com/display/POBLM/SSH+-+Tunnel+SSH+vers+MySQL)

English:

Example of data migration with pcf task and flyway.

This blueprint illustrates the use of flyway to load a database into PaaS. This is a Spring Boot CommandLineRunner application saved in PCF as a task.

The scheduler for PCF is then used to perform this task.

Before executing the scripts, you must install the cf plugin for the scheduler. Download the correct version here.

Then save the plugin in cf as follows:

cf install-plugin [path-to-plugin]
The register_task.sh script registers the PCF task cf-task-flyway-migration.

The job_create_and_execute.sh script creates a job in the Scheduler for PCF and executes it immediately.

To add a schedule instead of an immediate execution:

cf schedule-job [job-name] [cron-exp]
[day-of-month]

For example, to run the job-cf-task-flyway-migration job at 4:15 pm on December 13:

see schedule-job job-cf-task-flyway-migration "15 16 13 12?"
Attention: the schedule time is in UTC

See the scheduler's PCF documentation for more information

To view the data:

ssh tunnel example to mysql
