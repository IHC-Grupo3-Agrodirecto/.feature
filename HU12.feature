Feature: Declaración de urgencia en carga de productor
  Como productor agrícola
  Deseo marcar mi carga como "Urgente"
  Para que el algoritmo priorice mi consolidación rápida

  Scenario: Aceleración de emparejamiento por urgencia
    Given que el productor está publicando una carga
    When activa el flag "Carga urgente"
    And presiona "Publicar"
    Then el sistema acelera el emparejamiento automáticamente
    And la carga se consolida en máximo 2 horas
    And recibe notificación: "Tu carga tiene alta prioridad en consolidación"

  Scenario: Visualización de carga urgente en mapa de transportistas
    Given una carga marcada como urgente está publicada
    When otros productores o transportistas ven el mapa de cargas disponibles
    Then la carga aparece con un ícono rojo de emergencia
    And una etiqueta: "URGENTE"
    And transportistas ven: "Consolidación: dentro de 2 horas"