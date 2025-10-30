<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Mini Gestionnaire de Tâches Collaboratif</title>
    <meta charset="UTF-8">
</head>
<body>
    <h1>Projet : Mini Gestionnaire de Tâches Collaboratif</h1>

    <h2>Objectifs pédagogiques</h2>
    <p>
        Créer une application web dynamique en Java avec JSP/Servlets.<br>
        Utiliser la programmation orientée objet (POO).<br>
        Manipuler des collections d’objets Java.
    </p>

    <h2>Contexte</h2>
    <p>
        Dans le cadre de votre module sur la programmation Java, vous devez créer une application web simple permettant à un utilisateur de :
        <ul>
            <li>Ajouter des tâches</li>
            <li>Consulter la liste de ses tâches</li>
        </ul>
        Chaque tâche doit contenir :
        <ul>
            <li>Un titre</li>
            <li>Une description</li>
        </ul>
        Les tâches doivent être conservées le temps de la session de l’utilisateur (pas besoin de base de données).
    </p>

    <h2>Contraintes techniques</h2>
    <ul>
        <li>Créer une classe Java représentant une tâche (Task) avec des attributs privés.</li>
        <li>L’ajout de tâches se fait via un formulaire HTML dans cette page.</li>
        <li>Les tâches sont enregistrées dans une liste stockée en session (<code>ArrayList&lt;Task&gt;</code>).</li>
        <li>L'affichage des tâches utilise une boucle dans cette page JSP.</li>
        <li>Le projet doit pouvoir être déployé dans un serveur Apache Tomcat.</li>
    </ul>

    <h2>Fonctionnalités attendues</h2>
    <ul>
        <li>Ajouter une tâche : formulaire dans la page JSP.</li>
        <li>Afficher les tâches : liste visible avec titre et description.</li>
        <li>Accueil : page d'accueil avec navigation vers les autres fonctionnalités.</li>
        <li>Suppression d’une tâche : permettre la suppression d'une tâche.</li>
        <li>Date d’échéance : la tâche contiendra une « date d’échéance ».</li>
        <li>Tâche terminée : permettre de marquer une tâche comme terminée.</li>
    </ul>

    <h2>Livrables attendus</h2>
    <p>
        - Le lien URL de votre Repository GitHub contenant l'application fonctionnelle : JSP, classe(s) Java (Task.java), fichier web.xml.<br>
        - Votre application disponible sur le serveur AWS.
    </p>

    <p><a href="index.html">Retour à l'accueil</a></p>
</body>
</html>
