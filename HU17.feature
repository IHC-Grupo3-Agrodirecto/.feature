Feature: Alerta de camión lleno para productor
  Como productor agrícola
  Deseo recibir un aviso cuando el camión completa capacidad
  Para saber que el camión ya está listo y el viaje es seguro

  Scenario: Notificación al 100% de capacidad
    Given que un viaje consolidado está en proceso
    And ya tiene 4 cargas (15 toneladas)
    And el camión tiene capacidad de 18 toneladas
    When se añade la 5ta carga (3 toneladas)
    And se alcanza exactamente 100% de capacidad
    Then cada productor recibe notificación push:
      | Contenido de notificación                |
      | "¡Camión listo para partir!"            |
      | "Tu carga está confirmada"              |
      | "Salida programada: 14:00 hrs"          |
      | "Ahorro final: S/ 45"                   |
      | "Transportista: Roberto Campos"         |

  Scenario Outline: Notificación con detalles del viaje
    Given que el camión se llena completamente
    When se alcanza capacidad máxima:
      | Capacidad       | Carga utilizada | Cargas incluidas |
      | <capacidad>     | <utilizada>     | <numero>         |
    Then aparece pantalla de confirmación que muestra:
      | Detalle                                 |
      | Hora de recojo en tu punto              |
      | Ruta completa                           |
      | Conductor: <nombre_transportista>       |
      | Placa del camión: <placa>              |
      | Ahorro total para ti                    |
      | Opción: "Listo" / "Tengo una duda"     |

    Examples:
      | capacidad     | utilizada | numero | nombre_transportista | placa    |
      | 18 toneladas  | 18 ton    | 5      | Roberto Campos       | ABC-1234 |
      | 22 toneladas  | 22 ton    | 6      | Luis Martínez        | DEF-5678 |