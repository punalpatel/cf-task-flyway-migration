
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