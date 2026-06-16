Feature: Reasignación de cargas por falla de camión
  Como sistema,
  Quiero mover las cargas a otro camión disponible si el primero se avería,
  Para no dejar al productor desprotegido.

  Scenario Outline: Retorno automático de cargas al pool de consolidación urgente
    Given que el transportista ha confirmado una avería de tipo <tipo-averia>
    When el sistema valida y confirma el reporte de avería
    Then las cargas deben volver automáticamente al pool de consolidación con prioridad <tipo-prioridad> y estado <estado-carga>
    Examples: Tipos de avería y respuesta del sistema
      | tipo-averia          | tipo-prioridad | estado-carga          |
      | "Falla mecánica"     | "Urgente"      | "Pendiente de reasignación" |
      | "Accidente de ruta"  | "Urgente"      | "Pendiente de reasignación" |

  Scenario Outline: Asignación automática a nuevo camión disponible y notificación a productores
    Given que existen cargas urgentes en el pool por avería del camión original
    When el sistema detecta un camión disponible en un radio de <radio-busqueda> km
    Then debe asignar automáticamente las cargas al nuevo transportista y notificar a los productores con el mensaje <tipo-notificacion>
    Examples: Radios de búsqueda y notificación de reasignación
      | radio-busqueda | tipo-notificacion                                        |
      | 20             | "Su carga ha sido reasignada a un nuevo transportista"   |
      | 35             | "Su carga ha sido reasignada a un nuevo transportista"   |