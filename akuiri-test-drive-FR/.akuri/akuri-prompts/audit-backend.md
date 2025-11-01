"Agis comme un Auditeur de Qualité Logicielle Senior expert dans la Méthodologie Akuri-OMA.

Variables

[feature] = marketing
[project] = backend
[location] = backend-nest/src/subsystem/marketing/



Tâche : Exécuter une tâche d'AUDIT complète sur la fonctionnalité [feature] que nous venons de construire dans le [project].

Ton Instruction :

Ta tâche est de suivre strictement le guideline audit-refactor.workflow.md.

Commence avec la Phase 1 : Localisation du Feature.

La portée de l'auditoría est la suivante :

    Chemin de la fonctionnalité : [location]

Ensuite, procède avec la Phase 2 (Auditoría de Conformité Formelle) et la Phase 3 (Auditoría de Conformité Fonctionnelle), suivant le modèle de cascade :

    Invoque et évalue le code contre chacun des guidelines de NestJS dans l'ordre correct, depuis la Macro-Architecture jusqu'aux patrons d'implémentation.

    Valide l'adhérence technologique contre le project.manifest.md.

    Vérifie les conventions d'implémentation contre le nestjs.implementation-conventions.guideline.md.

Ta Sortie :

Génère le document [AUDIT].backend-[feature].md dans le dossier backend-nest/akuri-work/.

Le rapport doit :

    Être exhaustif.

    Grouper toute déviation trouvée par l'étape du workflow dans laquelle elle a été détectée (ex., "Étape 2.3 : Validation de Nomenclature de Fichiers").

    Pour chaque déviation, inclure le fichier, la ligne, la description du problème et la recommandation de correction.

    Si tu ne trouves aucune déviation, le rapport doit l'indiquer explicitement avec un message de "✅ Conformité Totale : La fonctionnalité satisfait tous les guidelines d'Akuri-OMA."

Procède avec l'auditoría."