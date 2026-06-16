Feature: Aceptación masiva de lote consolidado
  Como transportista,
  Quiero aceptar un lote ya consolidado de agricultores en un solo clic,
  Para asegurar el viaje lleno de forma rápida.

  Scenario Outline: Bloqueo de capacidad al aceptar un lote consolidado
    Given que existe una oferta de grupo consolidado de <numero-agricultores> agricultores con <peso-total> toneladas de carga
    When el transportista pulsa el botón "Aceptar" sobre el lote
    Then el sistema debe bloquear la capacidad del camión para esos <numero-agricultores> pedidos específicos y mostrar el estado <estado-capacidad> impidiendo aceptar más cargas
    Examples: Lotes consolidados y bloqueo de capacidad
      | numero-agricultores | peso-total | estado-capacidad    |
      | 5                   | 8          | "Capacidad completa"|
      | 4                   | 6          | "Capacidad completa"|

  Scenario Outline: Notificación individual a cada productor tras confirmación del lote
    Given que un lote consolidado ha sido aceptado por el transportista <nombre-transportista>
    When el sistema confirma la aceptación del lote completo
    Then cada productor debe recibir una notificación con el mensaje <tipo-notificacion> indicando el nombre del transportista y la hora estimada de recojo <hora-estimada>
    Examples: Notificaciones enviadas a productores por confirmación
      | nombre-transportista | hora-estimada | tipo-notificacion                                                              |
      | "Carlos Quispe"      | "08:30"       | "Tu carga ha sido asignada a Carlos Quispe. Hora estimada de recojo: 08:30"   |
      | "Luis Mamani"        | "10:00"       | "Tu carga ha sido asignada a Luis Mamani. Hora estimada de recojo: 10:00"     |
